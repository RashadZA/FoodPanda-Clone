import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodpanda_clone/Services/Storage%20Services/Local%20DB/item_table.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:foodpanda_clone/View/Components/core_flat_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class Dialogs {
  ScreenshotController screenshotController = ScreenshotController();
  void statusDialog01({
    required Uint8List invoice,
  }) {
    RxBool isLoading = false.obs;
    double height = Get.height * 0.4;
    double width = Get.width * 0.9;
    Get.dialog(
      Center(
        child: Container(
          height: height,
          width: width,
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 40,
                width: width,
                color: AppColors.primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Receipt Status",
                      style: AppTextTheme.text18.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.visible),
                    ),
                    Material(
                      color: AppColors.primaryColor,
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: Text(
                          close,
                          style: AppTextTheme.text18.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.visible),
                        ),
                      ),
                    ),
                  ],
                ).paddingAll(5),
              ),
              SizedBox(
                height: height - 40,
                width: width,
                child: Image.memory(
                  invoice,
                  fit: BoxFit.fill,
                ),
              ),

            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  void statusDialog({
    required String roteKey,
    required String roteName,
    required List<Map> categories,
    required List itemsList,
    required double total,
  }) {
    RxBool isLoading = false.obs;
    double height = Get.height * 0.8;
    double width = (Get.width * 0.9);
    double width1 = Get.width * 0.9;

    Get.dialog(
      Center(
        child: Container(
          height: height,
          width: width1,
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 40,
                width: width1,
                color: AppColors.primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Receipt Status",
                      style: AppTextTheme.text18.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.visible),
                    ),
                    Material(
                      color: AppColors.primaryColor,
                      child: InkWell(
                        onTap: () {
                          screenshotController.capture().then((image) async {
                            if(image != null){
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
                              }
                            }else{
                              "Unable to take ScreenShot".errorSnackBar();
                            }
                          });
                          Get.back();
                        },
                        child: Text(
                          "Save",
                          style: AppTextTheme.text18.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.visible),
                        ),
                      ),
                    ),
                  ],
                ).paddingAll(5),
              ),
              Screenshot(
                controller: screenshotController,
                child:  Container(
                  height: height - 40,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                  ),
                  child: SingleChildScrollView(
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
                                width: (width -10) * 0.5,
                                child: Text(
                                  "Name",
                                  style: AppTextTheme.text14.copyWith(
                                      fontWeight: FontWeight.w700,
                                      overflow: TextOverflow.visible),
                                ),
                              ),
                              SizedBox(
                                width: (width -10) * 0.2,
                                child: Text(
                                  "Qty",
                                  style: AppTextTheme.text14.copyWith(
                                      fontWeight: FontWeight.w700,
                                      overflow: TextOverflow.visible),
                                ),
                              ),
                              SizedBox(
                                width: (width -10) * 0.3,
                                child: Text(
                                  "Price",
                                  style: AppTextTheme.text14.copyWith(
                                      fontWeight: FontWeight.w700,
                                      overflow: TextOverflow.visible),
                                ),
                              ),
                            ],
                          ).paddingOnly(left: 5, right: 5),
                          const SizedBox(
                            height: 20,
                          ),
                          for (Map item in itemsList) ...[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: (width -10) * 0.5,
                                  child: Text(
                                    "${item['itemName']}",
                                    style: AppTextTheme.text14.copyWith(
                                        fontWeight: FontWeight.w700,
                                        overflow: TextOverflow.visible),
                                  ),
                                ),
                                SizedBox(
                                  width: (width -10) * 0.2,
                                  child: Text(
                                    "${item['itemQuantity']}",
                                    style: AppTextTheme.text14.copyWith(
                                        fontWeight: FontWeight.w700,
                                        overflow: TextOverflow.visible),
                                  ),
                                ),
                                SizedBox(
                                  width: (width -10) * 0.3,
                                  child: Text(
                                    "${item['itemTotalPrice']}",
                                    style: AppTextTheme.text14.copyWith(
                                        fontWeight: FontWeight.w700,
                                        overflow: TextOverflow.visible),
                                  ),
                                ),
                              ],
                            ).paddingOnly(left: 5, right: 5),
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
                ),
              ),

            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
  Future<void> downloadInvoice({
    required String roteKey,
    required String roteName,
    required List<Map> categories,
    required List itemsList,
    required double total,
  }) async {
    screenshotController.capture().then((image) async {
      if(image != null){
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
}
