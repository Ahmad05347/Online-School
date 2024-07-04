import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/common/values/colors.dart';

AppBar buildSettingsAppBar() {
  return AppBar(
    centerTitle: true,
    title: Container(
      child: Container(
        child: Text(
          "Settings",
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
      ),
    ),
  );
}

Widget settingsButton(BuildContext context, void Function()? func) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            "Confirm Logout",
          ),
          content: const Text(
            "Confirm Logout",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
              child: const Text(
                "Cancel",
              ),
            ),
            TextButton(
              onPressed: func,
              child: const Text(
                "Confirm",
              ),
            ),
          ],
        ),
      );
    },
    child: Container(
      height: 100.w,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/icons/Logout.png",
          ),
          fit: BoxFit.fitHeight,
        ),
      ),
    ),
  );
}
