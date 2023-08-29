import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_clone/Services/Login%20Service/forget_passsword_auth.dart';
import 'package:foodpanda_clone/Services/Login%20Service/registration_auth.dart';
import 'package:foodpanda_clone/Services/Routes/app_pages.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  // form key
  final forgetPasswordFormKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailEditingController = TextEditingController();


  RxBool checkedValue = false.obs;
  RxBool checkboxValue = false.obs;

  RxBool isSigningUp = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {}

  Future<void> signUp() async {
    isSigningUp.value = true;
    if (forgetPasswordFormKey.currentState!.validate()) {
      await ForgetPasswordAuth().forgetPassword(userEmail: emailEditingController.text);
    }
    isSigningUp.value = false;
  }
}
