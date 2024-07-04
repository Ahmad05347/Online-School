import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/common/values/colors.dart';

AppBar buildAppBar(String type) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
    centerTitle: true,
    title: Text(
      type,
      style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.primaryText),
    ),
  );
}

// we need content for accessing bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.only(left: 50.w, right: 50.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reuseableIcons("google"),
        _reuseableIcons("apple"),
        _reuseableIcons("facebook"),
      ],
    ),
  );
}

Widget _reuseableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reuseableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.8),
          fontWeight: FontWeight.normal,
          fontSize: 14.sp),
    ),
  );
}

Widget buildTextField(String textType, String hintText, String iconName,
    void Function(String value)? function) {
  return Container(
    margin: EdgeInsets.only(bottom: 16.h),
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(16.w),
      ),
      border: Border.all(color: AppColors.primaryFourElementText),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 17.w),
          width: 16.w,
          height: 16.w,
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextFormField(
            onChanged: (value) => function!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintStyle: const TextStyle(
                color: AppColors.primarySecondaryElementText,
              ),
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
            ),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
          ),
        ),
      ],
    ),
  );
}

Widget forgetPassword() {
  return Container(
    margin: EdgeInsets.only(left: 5.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot Password?",
        style: TextStyle(
            color: AppColors.primaryText,
            decoration: TextDecoration.underline,
            fontSize: 12.sp,
            decorationColor: AppColors.primaryText),
      ),
    ),
  );
}

Widget loginAndRegButton(
    String buttonName, String textType, void Function()? function) {
  return GestureDetector(
    onTap: function,
    child: Container(
      // margin: EdgeInsets.only(left: 25.w, right: 25.w),
      margin: EdgeInsets.only(top: textType == "login" ? 40.h : 10.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(
            color: textType == "login"
                ? Colors.transparent
                : AppColors.primaryFourElementText),
        borderRadius: BorderRadius.circular(16.w),
        color: textType == "register" ? Colors.white : AppColors.primaryElement,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
            color: Colors.grey.withOpacity(0.1),
          ),
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: textType == "register" ? Colors.black : Colors.white),
        ),
      ),
    ),
  );
}
