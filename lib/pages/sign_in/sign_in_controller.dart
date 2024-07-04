import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:u_learning/common/api/user_api.dart';
import 'package:u_learning/common/entities/entities.dart';
import 'package:u_learning/common/values/constant.dart';
import 'package:u_learning/common/widgets/flutter_toast.dart';
import 'package:u_learning/global.dart';
import 'package:u_learning/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;

        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "Please enter your email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "Please enter your password");
          return;
        }
        try {
          final crednetials = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (crednetials.user == null) {
            toastInfo(msg: "You dont exist");
            return;
          }
          if (!crednetials.user!.emailVerified) {
            toastInfo(msg: "Please verify your email address");
            return;
          }

          var user = crednetials.user;
          if (user != null) {
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = emailAddress;
            loginRequestEntity.open_id = id;
            loginRequestEntity.type = 1;

            asyncPostAllData(loginRequestEntity);

            // ignore: use_build_context_synchronously
            Navigator.pushNamedAndRemoveUntil(
                context, "/application", (route) => false);
            return;
          } else {
            toastInfo(msg: "Currently You are not a user of the app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            toastInfo(msg: "No user found for that email");
          } else if (e.code == "Wrong-password") {
            toastInfo(msg: "Please enter a valid password");
          } else if (e.code == "invalid-email") {
            toastInfo(msg: "Please enter a valid email");
          }
        }
      }
    } catch (e) {}
  }

  Future<void> asyncPostAllData(
    LoginRequestEntity loginRequestEntity,
  ) async {
    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    var result = await UserApi.login(params: loginRequestEntity);
    if (result.code == 200) {
      try {
        Global.storageService.setString(
          AppConstants.STORAGE_USER_PROFILE_KEY,
          jsonEncode(result.data!),
        );
        Global.storageService.setString(
          AppConstants.STORAGE_USER_TOKEN_KEY,
          result.data!.access_token!,
        );
        EasyLoading.dismiss();
        Navigator.pushNamedAndRemoveUntil(
            context, "/application", (route) => false);
      } catch (e) {
        print("saving local storage ${e.toString()}");
      }
    } else {
      EasyLoading.dismiss();
      toastInfo(msg: "Unknown error");
    }
  }
}
