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
          child: SingleChildScrollView(
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
                Image.memory(
                  invoice,
                  height: height - 40,
                  width: width,
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

}
