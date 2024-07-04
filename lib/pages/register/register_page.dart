import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/pages/common_widget.dart';
import 'package:u_learning/pages/register/bloc/register_blocs.dart';
import 'package:u_learning/pages/register/bloc/register_events.dart';
import 'package:u_learning/pages/register/bloc/register_state.dart';
import 'package:u_learning/pages/register/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Sign Up"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: reuseableText(
                          "Enter your details below and sign up for free"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reuseableText("Username"),
                          buildTextField(
                            "email",
                            "Enter your username",
                            "user",
                            (value) {
                              context.read<RegisterBlocs>().add(
                                    UserNameEvents(value),
                                  );
                            },
                          ),
                          reuseableText("E-mail"),
                          buildTextField(
                            "email",
                            "Enter your email",
                            "user",
                            (value) {
                              context.read<RegisterBlocs>().add(
                                    EmailEvents(value),
                                  );
                            },
                          ),
                          reuseableText("Password"),
                          buildTextField(
                            "password",
                            "Enter your password",
                            "lock",
                            (value) {
                              context.read<RegisterBlocs>().add(
                                    PasswordEvents(value),
                                  );
                            },
                          ),
                          reuseableText("Confirm Password"),
                          buildTextField(
                            "password",
                            "Confirm your password",
                            "lock",
                            (value) {
                              context.read<RegisterBlocs>().add(
                                    RePasswordEvents(value),
                                  );
                            },
                          ),
                          reuseableText(
                              "By creating an account you have to agree to our terms & conditions"),
                          SizedBox(
                            height: 25.h,
                          ),
                          loginAndRegButton(
                            "Sign Up",
                            "log in",
                            () {
                              //  Navigator.pushNamed(context, "register");
                              RegisterController(context)
                                  .handleEmailRegistration();
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
