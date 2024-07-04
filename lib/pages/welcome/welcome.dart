import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/common/values/colors.dart';
import 'package:u_learning/common/values/constant.dart';
import 'package:u_learning/global.dart';
import 'package:u_learning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:u_learning/pages/welcome/bloc/welcome_evnts.dart';
import 'package:u_learning/pages/welcome/bloc/welcome_state.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(
                        WelcomeEvents(),
                      );
                    },
                    children: [
                      _pages(
                        1,
                        context,
                        "Next",
                        "Learning curve",
                        "Forget about a for of all paper, access all knowledge in one place",
                        "assets/images/reading.png",
                      ),
                      _pages(
                        2,
                        context,
                        "Next",
                        "Connect With Everyone",
                        "Always keep in touch with your tutor & friends, let's get connected!",
                        "assets/images/boy.png",
                      ),
                      _pages(
                        3,
                        context,
                        "Get Started",
                        "Always Fascinated Learning",
                        "AnyWhere, anytime. The time is at your discretion so study whenever you want",
                        "assets/images/man.png",
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 70.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: AppColors.primaryElement,
                        size: const Size.square(8),
                        activeSize: const Size(18, 8),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _pages(int index, BuildContext context, String buttonName,
      String title, String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
              );
            } else {
              Global.storageService
                  .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              print("Value is ${Global.storageService.getDeviceFirstOpen()}");
              Navigator.pushNamedAndRemoveUntil(
                  context, "/sign_in", (route) => false);
            }
          },
          child: Container(
            width: 325.w,
            height: 50.h,
            margin: EdgeInsets.only(top: 100.h, right: 25.w, left: 25.w),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(16.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
