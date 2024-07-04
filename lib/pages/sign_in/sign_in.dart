import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/pages/common_widget.dart';
import 'package:u_learning/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:u_learning/pages/sign_in/bloc/sign_in_events.dart';
import 'package:u_learning/pages/sign_in/bloc/signin_state.dart';
import 'package:u_learning/pages/sign_in/sign_in_controller.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Log In"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context),
                    Center(
                      child:
                          reuseableText("Or use your E-mail account to login"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 36.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reuseableText("E-mail"),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField("email", "Enter your email", "user",
                              (value) {
                            context.read<SignInBloc>().add(
                                  EmailEvents(email: value),
                                );
                          }),
                          reuseableText("Password"),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                            "password",
                            "Enter your password",
                            "lock",
                            (value) {
                              context.read<SignInBloc>().add(
                                    PasswordEvent(password: value),
                                  );
                            },
                          ),
                          forgetPassword(),
                          SizedBox(
                            height: 70.h,
                          ),
                          loginAndRegButton(
                            "LogIn",
                            "login",
                            () {
                              SignInController(context: context)
                                  .handleSignIn("email");
                            },
                          ),
                          loginAndRegButton(
                            "Sign Up",
                            "register",
                            () {
                              Navigator.pushNamed(context, "/register");
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
