import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodpanda_clone/Services/Storage%20Services/Local%20DB/item_table.dart';
import 'package:foodpanda_clone/Services/internet.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:get/get.dart';

class ItemController extends GetxController {
  final height = Get.height;
  final width = Get.width;

  RxBool isLoading = false.obs;

  RxList itemsList = [].obs;

  RxList cartItemList = [].obs;

  RxList allData = [].obs;

  RxString itemKey = "".obs;

  RxString itemName = "".obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    isLoading.value = true;
    await getDataFromWhileRoutingToItemScreen();
    await getData();
    await getDataFromFireStore();
    isLoading.value = false;
    update();
  }

  Future<void> getDataFromWhileRoutingToItemScreen() async {
    itemKey.value = Get.parameters['itemKey'] ?? "";
    itemName.value = Get.parameters['itemName'] ?? "";
    update();
  }
  Future<void> getData() async {
    cartItemList.value = await ItemTable().getItemsListFromTable();
  }
  Future<void> getDataFromFireStore() async {
    allData.value = [];
    itemsList.value = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(itemKey.value).get();
    allData.value = querySnapshot.docs.map((doc) => doc.data()).toList();
    itemsList.value = allData[0][itemKey.value];
    update();
    print("All Data: ${allData}");
    print("Categories Data: ${itemsList}");
  }

  Future<void> getDataAfterComingBackToItemScreen({required String key, required String name}) async {
    print("After key ${key}");
    print("After name ${name}");
    isLoading.value = true;
    itemKey.value = key;
    itemName.value = name;
    print("After Item ${itemKey.value}");
    print("After Item ${itemName.value}");
    update();
    await getData();
    isLoading.value = false;
    update();
  }

}