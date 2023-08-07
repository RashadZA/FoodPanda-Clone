import 'package:flutter/material.dart';
import 'package:foodpanda_clone/Controller/login_controller.dart';
import 'package:foodpanda_clone/Services/Routes/app_pages.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SizedBox(
          height: double.maxFinite,
          child: SingleChildScrollView(
            child: SizedBox(
              width: Get.width,
              height: Get.height,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.home);
                  },
                  child: Text(
                      login,
                    style: AppTextTheme.text16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
