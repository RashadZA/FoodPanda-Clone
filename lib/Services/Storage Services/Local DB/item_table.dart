import 'package:foodpanda_clone/Services/Storage%20Services/Local%20DB/local_db.dart';
import 'package:sqflite/sqflite.dart';

class ItemTable {
  String itemsTable = 'itemsTable';
  String primeKey = 'primeKey';
  String itemKey = 'itemKey';
  String itemImageUrl = 'itemImageUrl';
  String itemName = 'itemName';
  String itemCategory = 'itemCategory';
  String itemDescription = 'itemDescription';
  String itemQuantity = 'itemQuantity';
  String itemBasePrice = 'itemBasePrice';
  String itemTotalPrice = 'itemTotalPrice';

  Future getItemsListFromTable() async {
    Database db = await DatabaseHelper().database;

    var result = await db.query(itemsTable, orderBy: '$primeKey ASC');
    print("Result: $result");
    return result;
  }
  Future getItemsCategoryListFromTable() async {
    Database db = await DatabaseHelper().database;

    var result = await db.query(itemsTable, distinct: true, columns: ['itemCategory'], orderBy: '$primeKey ASC');
    print("Category: $result");
    return result;
  }

  Future insertItemIntoTable({
    String? keyOfItem,
    String? nameOfItem,
    String? categoryOfItem,
    String? descriptionOfItem,
    String? quantityOfItem,
    String? basePriceOfItem,
    String? totalPriceOfItem,
  }) async {
    Database db = await DatabaseHelper().database;
    var row = {
      itemKey: keyOfItem,
      itemName: nameOfItem,
      itemCategory: categoryOfItem,
      itemDescription: descriptionOfItem,
      itemQuantity: quantityOfItem,
      itemBasePrice: basePriceOfItem,
      itemTotalPrice: totalPriceOfItem
    };
    var result = await db.insert(itemsTable, row,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future updateItemQuantity(
      {int? itemPrimeKey,
      String? keyOfItem,
      String? quantityOfItem,
      String? totalPriceOfItem}) async {
    Database db = await DatabaseHelper().database;
    var row = {
      itemKey: keyOfItem,
      itemQuantity: quantityOfItem,
      itemTotalPrice: totalPriceOfItem,
    };
    var result = await db.update(itemsTable, row,
        where: 'primeKey =$itemPrimeKey and itemKey = \'$keyOfItem\'');
    return result;
  }

  Future deleteItem({int? itemPrimeKey, String? keyOfItem}) async {
    Database db = await DatabaseHelper().database;

    var result = await db.delete(itemsTable,
        where: 'primeKey =$itemPrimeKey and itemKey = \'$keyOfItem\'');
    return result;
  }

  Future clearItemTable() async {
    Database db = await DatabaseHelper().database;
    return await db.rawDelete("DELETE FROM $itemsTable");
  }
}
