// ignore_for_file: inference_failure_on_function_return_type
import 'package:fintech_test/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {required this.onTap, required this.currentIndex, super.key});

  final Function(int) onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 2,
      backgroundColor: AppColors.secondaryLigthBackground,
      selectedItemColor: AppColors.selectedColor,
      unselectedItemColor: AppColors.titleColor,
      onTap: onTap,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.all(5.r),
            child: SvgPicture.asset(
              'assets/svgs/home_icon.svg',
              height: 24.sp,
              width: 24.sp,
            ),
          ),
          activeIcon: Container(
            padding: EdgeInsets.all(5.r),
            child: SvgPicture.asset(
              'assets/svgs/home_icon.svg',
              height: 24.sp,
              width: 24.sp,
              colorFilter: const ColorFilter.mode(
                  AppColors.selectedColor, BlendMode.srcIn),
            ),
          ),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.all(5.r),
            child: SvgPicture.asset(
              'assets/svgs/transfer_icon.svg',
              height: 24.sp,
              width: 24.sp,
            ),
          ),
          activeIcon: Container(
            padding: EdgeInsets.all(5.r),
            child: SvgPicture.asset(
              'assets/svgs/transfer_icon.svg',
              height: 24.sp,
              width: 24.sp,
              colorFilter: const ColorFilter.mode(
                  AppColors.selectedColor, BlendMode.srcIn),
            ),
          ),
          label: 'Transferencias',
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.all(5.r),
            child: SvgPicture.asset(
              'assets/svgs/analytics_icon.svg',
              height: 24.sp,
              width: 24.sp,
            ),
          ),
          activeIcon: Container(
            padding: EdgeInsets.all(5.r),
            child: SvgPicture.asset(
              'assets/svgs/analytics_icon.svg',
              height: 24.sp,
              width: 24.sp,
              colorFilter: const ColorFilter.mode(
                  AppColors.selectedColor, BlendMode.srcIn),
            ),
          ),
          label: 'Analisis',
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.all(5.r),
            child: SvgPicture.asset(
              'assets/svgs/profile_icon.svg',
              height: 24.sp,
              width: 24.sp,
            ),
          ),
          activeIcon: Container(
            padding: EdgeInsets.all(5.r),
            child: SvgPicture.asset(
              'assets/svgs/profile_icon.svg',
              height: 24.sp,
              width: 24.sp,
              colorFilter: const ColorFilter.mode(
                  AppColors.selectedColor, BlendMode.srcIn),
            ),
          ),
          label: 'Cuenta',
        ),
      ],
    );
  }
}
