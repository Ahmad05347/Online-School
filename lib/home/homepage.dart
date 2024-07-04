import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/common/values/colors.dart';
import 'package:u_learning/home/bloc/homepage_blocs.dart';
import 'package:u_learning/home/bloc/homepage_states.dart';
import 'package:u_learning/home/widget/homepage_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildHomeAppBar(),
      body: BlocBuilder<HomePageBlocs, HomePageStates>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: CustomScrollView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText(
                    "Hello",
                    color: AppColors.primaryThreeElementText,
                  ),
                ),
                SliverToBoxAdapter(
                  child: homePageText(
                    "Ahmad",
                    top: 0,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                    top: 20.h,
                  ),
                ),
                SliverToBoxAdapter(
                  child: searchView(),
                ),
                SliverToBoxAdapter(
                  child: sliderView(
                    context,
                    state,
                  ),
                ),
                SliverToBoxAdapter(
                  child: menuView(),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 18.h,
                    horizontal: 0.w,
                  ),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.6,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {},
                          child: courseGrid(),
                        );
                      },
                      childCount: 4,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
