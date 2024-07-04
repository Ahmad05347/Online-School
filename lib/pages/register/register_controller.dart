import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/values/constant.dart';
import 'package:u_learning/common/widgets/flutter_toast.dart';
import 'package:u_learning/pages/register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController(this.context);

  Future<void> handleEmailRegistration() async {
    final state = context.read<RegisterBlocs>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "UserName cannot be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email cannot be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password cannot be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Your password confirmation is wrong");
      return;
    }
    try {
      final credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credentials.user != null) {
        await credentials.user?.sendEmailVerification();
        await credentials.user?.updateDisplayName(userName);
        String photoUrl = "${AppConstants.SERVER_API_URL}uploads/images.png";
        await credentials.user?.updatePhotoURL(photoUrl);
        toastInfo(
            msg:
                "An email has been sent to your registered email. To activate it please check your email box and click on the link");
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastInfo(msg: "The Password provided is too weak");
      } else if (e.code == "email-already-in-use") {
        toastInfo(msg: "The email is already in use");
      } else if (e.code == "invalid-email") {
        toastInfo(msg: "The email is invalid");
      }
    }
  }
}
