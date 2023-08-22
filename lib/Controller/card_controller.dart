import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodpanda_clone/Services/Storage%20Services/Local%20DB/item_table.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:foodpanda_clone/View/WIdgets/dialogs.dart';
import 'package:foodpanda_clone/View/WIdgets/invoice_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class CardController extends GetxController {
  RxBool isLoading = false.obs;

  RxBool isCheckingOut = false.obs;

  RxDouble itemSubTotal = 0.0.obs;

  RxList itemsList = [].obs;

  RxString routingFrom = "".obs;
  RxString itemRoteKey = "".obs;
  RxString itemRoteName = "".obs;

  late Uint8List receipt;

  ScreenshotController screenshotController = ScreenshotController();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    isLoading.value = true;
    itemSubTotal.value = 0.0;
    await getDataFromWhileRoutingToItemScreen();
    itemsList.value = await ItemTable().getItemsListFromTable();
    for (Map item in itemsList) {
      String price = item['itemTotalPrice'];
      itemSubTotal.value = itemSubTotal.value + double.parse(price);
    }
    isLoading.value = false;
  }

  Future<void> getDataFromWhileRoutingToItemScreen() async {
    routingFrom.value = Get.parameters['from'] ?? "";
    itemRoteKey.value = Get.parameters['itemKey'] ?? "";
    itemRoteName.value = Get.parameters['itemName'] ?? "";
    update();
  }

  Future<void> updateItemQuantity(
      {required int itemIndex,
      required String itemKey,
      required String updateType}) async {
    RxDouble quantity = 0.0.obs;
    RxDouble totalPrice = 0.0.obs;
    if (updateType == addItem) {
      quantity.value = double.parse(itemsList[itemIndex]['itemQuantity']) + 1;
    } else {
      quantity.value = double.parse(itemsList[itemIndex]['itemQuantity']) - 1;
    }
    totalPrice.value =
        quantity.value * double.parse(itemsList[itemIndex]['itemBasePrice']);
    if (quantity.value == 0) {
      await ItemTable().deleteItem(
          itemPrimeKey: itemsList[itemIndex]['primeKey'], keyOfItem: itemKey);
    } else {
      await ItemTable().updateItemQuantity(
          itemPrimeKey: itemsList[itemIndex]['primeKey'],
          keyOfItem: itemKey,
          quantityOfItem: "$quantity",
          totalPriceOfItem: "$totalPrice");
    }
    await init();
  }

  Future<void> deleteItemFromCart(
      {required int itemPrimeKey, required String itemKey}) async {
    await ItemTable()
        .deleteItem(itemPrimeKey: itemPrimeKey, keyOfItem: itemKey);
    await init();
  }

  Future<void> checkOut({required BuildContext context}) async {
    isCheckingOut.value = true;
    List<Map> categories = await ItemTable().getItemsCategoryListFromTable();
    update();
    if (context.mounted){
      Get.back(result: [
        {
          "itemKey": itemRoteKey.value,
          "itemName": itemRoteName.value,
        }
      ]);
      Dialogs().statusDialog(roteKey: itemRoteKey.value,
          roteName: itemRoteName.value,
          categories: categories,
          itemsList: itemsList,
          total: itemSubTotal.value);
      // await downloadInvoice(
      //     context: context,
      //     roteKey: itemRoteKey.value,
      //     roteName: itemRoteName.value,
      //     categories: categories,
      //     itemsList: itemsList,
      //     total: itemSubTotal.value);
    }
    await ItemTable().clearItemTable();
    isCheckingOut.value = false;
  }

  Future<void> downloadInvoice({
    required BuildContext context,
    required String roteKey,
    required String roteName,
    required List<Map> categories,
    required List itemsList,
    required double total,
  }) async {
    invoicePrintWidget(
        roteKey: roteKey,
        roteName: roteName,
        categories: categories,
        itemsList: itemsList,
        total: total,
        width: Get.width - 40);
    screenshotController.capture().then((image) async {
      if(image != null){
        receipt = image;
        update();
        // Handle captured image
        if (!await requestPermission(Permission.storage)) {
          await requestPermission(Permission.storage);
        }
        if (await requestPermission(Permission.storage)) {
          if (Platform.isAndroid) {
            downloadInvoiceForAndroid(
                fileName:
                DateFormat("MMM d yyyy hh.mm.ssa").format(DateTime.now()),
                invoice: image);
          } else if (Platform.isIOS) {
            downloadInvoiceForIOS(
                fileName:
                DateFormat("MMM d yyyy hh.mm.ssa").format(DateTime.now()),
                invoice: image);
          }
          Dialogs().statusDialog01(invoice: image);
        }
      }else{
        "Unable to take ScreenShot".errorSnackBar();
      }
    });
    // screenshotController
    //     .captureFromWidget(ReceiptWidget().invoicePrintWidget(
    //         roteKey: roteKey,
    //         roteName: roteName,
    //         categories: categories,
    //         itemsList: itemsList,
    //         total: total,
    //         width: Get.width - 40))
    //     .then((image) async {
    //       receipt = image;
    //       update();
    //   // Handle captured image
    //   if (!await requestPermission(Permission.storage)) {
    //     await requestPermission(Permission.storage);
    //   }
    //   if (await requestPermission(Permission.storage)) {
    //     if (Platform.isAndroid) {
    //       downloadInvoiceForAndroid(
    //           fileName:
    //               DateFormat("MMM d yyyy hh.mm.ssa").format(DateTime.now()),
    //           invoice: image);
    //     } else if (Platform.isIOS) {
    //       downloadInvoiceForIOS(
    //           fileName:
    //               DateFormat("MMM d yyyy hh.mm.ssa").format(DateTime.now()),
    //           invoice: image);
    //     }
    //     Dialogs().statusDialog01(invoice: image);
    //   }
    // });
  }

  Future<void> downloadInvoiceForAndroid(
      {required String fileName, required Uint8List invoice}) async {
    Directory? directory = await getExternalStorageDirectory();
    String newPath = "";
    if (directory != null) {
      newPath = "${directory.path.split("Android").first}Documents/FoodPanda Clone";
      final imageTempPath = '$newPath/$fileName.png';
      directory = Directory(newPath);
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        final imagePath = await File(imageTempPath).create();
        await imagePath.writeAsBytes(invoice);
      }
    }
  }

  Future<void> downloadInvoiceForIOS(
      {required String fileName, required Uint8List invoice}) async {
    Directory? directory = await getApplicationDocumentsDirectory();
    String saveDirPath = directory.absolute.path;
    final imageTempPath = '$saveDirPath/$fileName.png';
    if (!await Directory(saveDirPath).exists()) {
      await Directory(saveDirPath).create(recursive: true);
    }
    if (await Directory(saveDirPath).exists()) {
      File imagePath = await File(imageTempPath).create();
      await imagePath.writeAsBytes(invoice);
    }
  }

  Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }


  Widget invoicePrintWidget({
    required String roteKey,
    required String roteName,
    required List<Map> categories,
    required List itemsList,
    required double total,
    required double width,
  }) {
    return Screenshot(
      controller: screenshotController,
      child:  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (Map category in categories) ...[
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  category['itemCategory'] ?? "N/A",
                  style:
                  AppTextTheme.text14.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container().defaultDivider(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.5,
                    child: Text(
                      "Name",
                      style: AppTextTheme.text14.copyWith(
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.visible),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.2,
                    child: Text(
                      "Qty",
                      style: AppTextTheme.text14.copyWith(
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.visible),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.3,
                    child: Text(
                      "Price",
                      style: AppTextTheme.text14.copyWith(
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.visible),
                    ),
                  ),
                ],
              ).paddingOnly(left: 20, right: 20),
              const SizedBox(
                height: 20,
              ),
              for (Map item in itemsList) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width * 0.5,
                      child: Text(
                        "${item['itemName']}",
                        style: AppTextTheme.text14.copyWith(
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.visible),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.2,
                      child: Text(
                        "${item['itemQuantity']}",
                        style: AppTextTheme.text14.copyWith(
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.visible),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.3,
                      child: Text(
                        "${item['itemTotalPrice']}",
                        style: AppTextTheme.text14.copyWith(
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.visible),
                      ),
                    ),
                  ],
                ).paddingOnly(left: 20, right: 20),
              ],
            ],
            const SizedBox(
              height: 20,
            ),
            Container().defaultDivider(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * 0.5,
                  child: Text(
                    "Total Amount : ",
                    style: AppTextTheme.text14.copyWith(
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.visible),
                  ),
                ),
                SizedBox(
                  width: width * 0.3,
                  child: Text(
                    "$total",
                    style: AppTextTheme.text14.copyWith(
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.visible),
                  ),
                ),
              ],
            ).paddingOnly(left: 20, right: 20),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

}
