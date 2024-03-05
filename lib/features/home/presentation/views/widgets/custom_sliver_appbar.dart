import 'package:fintech_test/core/core.dart';
import 'package:fintech_test/features/home/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 250,
      collapsedHeight: 250,
      pinned: true,
      flexibleSpace: CustomFlexibleSpaceBar(),
    );
  }
}

class CustomFlexibleSpaceBar extends StatelessWidget {
  const CustomFlexibleSpaceBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildAppBarRow(),
          SizedBox(height: 70.h),
          buildSubText('Disponible', 15.sp),
          buildBalanceInfo(),
        ],
      ),
      background: Container(
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
        ),
      ),
    );
  }

  Widget buildAppBarRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width: 20.w),
        buildText('eCLUB', 20.sp),
        SizedBox(width: 20.w),
       Container(
          padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
         border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(10.r),),
         child: SvgPicture.asset(
          'assets/svgs/menu_icon.svg', // Ruta a tu archivo SVG
          height: 24.sp,
          width: 24.sp,
               ),
       ),
      ],
    );
  }

  Widget buildText(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: fontSize),
    );
  }
    Widget buildSubText(String text, double fontSize) {
    return Padding(
      padding: EdgeInsets.only(right: 77.w,),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: fontSize),
      ),
    );
  }

  Widget buildBalanceInfo() {
    return Padding(
      padding: EdgeInsets.only(right: 50.w, top: 20.h),
      child: BlocBuilder<HeaderBloc, HeaderState>(
        builder: (context, state) {
          bool showBalance;
          if (state.balanceStatus == BalanceStatus.hidden) {
            showBalance = false;
          } else {
            showBalance = true;
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.balanceStatus == BalanceStatus.hidden
                    ? state.balance!
                    : '**********',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 10.w),
              GestureDetector(
                onTap: () {
                  context.read<HeaderBloc>().add(ToggleBalance(showBalance));
                },
                child: Icon(
                  state.balanceStatus == BalanceStatus.hidden
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
