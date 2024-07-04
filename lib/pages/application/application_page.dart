import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/common/values/colors.dart';
import 'package:u_learning/pages/application/application_widget.dart';
import 'package:u_learning/pages/application/bloc/app_blocs.dart';
import 'package:u_learning/pages/application/bloc/app_events.dart';
import 'package:u_learning/pages/application/bloc/app_states.dart';

class ApplicationPages extends StatefulWidget {
  const ApplicationPages({super.key});

  @override
  State<ApplicationPages> createState() => _ApplicationPagesState();
}

class _ApplicationPagesState extends State<ApplicationPages> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: buildPage(state.index),
              bottomNavigationBar: Container(
                width: 375.w,
                height: 58.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  currentIndex: state.index,
                  onTap: (value) {
                    setState(
                      () {
                        context.read<AppBlocs>().add(
                              TrigerAppEvent(value),
                            );
                      },
                    );
                  },
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryFourElementText,
                  items: bottomTabs,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
