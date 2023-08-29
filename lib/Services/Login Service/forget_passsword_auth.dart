import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodpanda_clone/Services/Routes/app_pages.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:get/get.dart';

class ForgetPasswordAuth {
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<void> forgetPassword({
    required String userEmail,

  }) async {
    try{
      dynamic pass = await auth.sendPasswordResetEmail(email: userEmail).then((value) async {
        Get.offAllNamed(Routes.login);
        "We have sent you a mail for reset password...".successSnackBar();

      }).catchError((error){
        error.toString().errorSnackBar();
      });
      "$pass".successSnackBar();
    } catch(e){
      e.toString().errorSnackBar();
    }



  }

}