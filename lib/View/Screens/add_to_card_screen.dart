import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:foodpanda_clone/Controller/add_to_card_controller.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:foodpanda_clone/View/Components/core_flat_button.dart';
import 'package:get/get.dart';

class AddToCardScreen extends GetWidget<AddToCardController> {
  AddToCardScreen({super.key});
  final double height = Get.height;
  final double width = Get.width;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            addToCard,
          ),
          leading: IconButton(
            onPressed: () {
              Get.back(result: [
                {
                  "itemKey": controller.itemRoteKey.value,
                  "itemName": controller.itemRoteName.value,
                }
              ]);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            ),
          ),
        ),
        body: Obx(
          () => controller.isLoading.value == true
              ? Center(
                  child: SizedBox(
                  width: 50,
                  height: 50,
                  child: defaultLoader(color: AppColors.primaryColor),
                ).defaultContainer())
              : Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        selectImageFromLocal(
                          setImageMode(
                              "${AppImage.itemImagePath}/${controller.itemRoteKey.value}/${controller.itemKey.value}.png"),
                          height: height * 0.4,
                          width: width,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          controller.itemName.value,
                          style: AppTextTheme.text14.copyWith(
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.visible),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          controller.itemDescription.value,
                          style: AppTextTheme.text14.copyWith(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.visible),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          "Base Price: ${controller.itemBasePrice.value} Taka",
                          style: AppTextTheme.text14.copyWith(
                              color: AppColors.appTextPrimaryColor,
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.visible),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        SizedBox(
                          width: width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: (width - defaultLeftRightPadding) * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Quantity : ",
                                      style: AppTextTheme.text16,
                                    ),
                                    SizedBox(
                                      height: height * 0.015,
                                    ),
                                    SpinBox(
                                      value: 0,
                                      max: double.infinity,
                                      decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          borderSide: BorderSide(
                                              color: AppColors.primaryColor),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          borderSide: BorderSide(
                                              color: AppColors.primaryColor),
                                        ),
                                      ),
                                      onChanged: (double itemQuantity) {
                                        controller.addItemQuantity(
                                            itemQTY: itemQuantity);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: (width - defaultLeftRightPadding) * 0.05,
                              ),
                              SizedBox(
                                width: (width - defaultLeftRightPadding) * 0.55,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Price : ",
                                      style: AppTextTheme.text16,
                                    ),
                                    SizedBox(
                                      height: height * 0.015,
                                    ),
                                    Obx(
                                      () => Text(
                                        "CA\$${controller.itemTotalBasePrice}",
                                        style: AppTextTheme.text18.copyWith(
                                            fontWeight: FontWeight.w800,
                                            overflow: TextOverflow.visible),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Obx(() => CoreFlatButton(
                          text: "Add To Card",
                          isGradientBg: true,
                          onPressed: controller.addItemInTable,
                          isLoading: controller.addingToCard.value,
                        ).paddingSymmetric(horizontal: 20),),
                        SizedBox(
                          height: height * 0.05,
                        ),
                      ],
                    ).defaultContainer(),
                  ),
                ),
        ),
      ),
    );
  }
}
