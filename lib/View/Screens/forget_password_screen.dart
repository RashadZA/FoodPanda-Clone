import 'package:flutter/material.dart';
import 'package:foodpanda_clone/Controller/forget_password_controller.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:foodpanda_clone/View/Components/core_flat_button.dart';
import 'package:foodpanda_clone/View/Components/core_textField.dart';
import 'package:foodpanda_clone/View/WIdgets/header_widget.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends GetWidget<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Column(
              children: [
                Form(
                  key: controller.forgetPasswordFormKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 150),
                      Text('Forget Password',style: AppTextTheme.text18,),
                      const SizedBox(height: 30),
                      CoreTextField(
                        labelText: 'E-mail address',
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailEditingController,
                        validator: AuthValidator.emailValidator,
                      ),
                      const SizedBox(height: 20.0),
                      Obx(() => CoreFlatButton(
                        text: 'Forget Password'.toUpperCase(),
                        isGradientBg: true,
                        onPressed: controller.signUp,
                        isLoading: controller.isSigningUp.value,
                      ).paddingSymmetric(horizontal: 17)),
                    ],
                  ).paddingAll(20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
