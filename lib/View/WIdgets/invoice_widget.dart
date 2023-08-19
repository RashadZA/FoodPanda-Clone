import 'package:flutter/material.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:get/get.dart';

class ReceiptWidget {

  Widget invoicePrintWidget({
    required String roteKey,
    required String roteName,
    required List<Map> categories,
    required List itemsList,
    required double total,
    required double width,
  }) {
    return Container(
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
    );
  }
}