import 'package:fintech_test/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key, required this.title, required this.path});

  final String title;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLigthBackground,
      appBar: AppBar(
        centerTitle: true,
        title: Text(title,
            style: TextStyle(
                color: AppColors.selectedColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700)),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.selectedColor, width: 2),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: SvgPicture.asset(
                'assets/svgs/menu_icon.svg',
                height: 24.sp,
                width: 24.sp,
                colorFilter: const ColorFilter.mode(
                    AppColors.selectedColor, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 90.h),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondaryLigthBackground.withOpacity(0.7),
                    spreadRadius: 15,
                    blurRadius: 15,
                    offset: const Offset(0, 3),
                  ),
                ],
                shape: BoxShape.circle,
                color: AppColors.primaryLigthBackground,
              ),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryLigthBackground,
                  ),
                  child: SvgPicture.asset(
                   path,
                    height: 60.sp,
                    width: 60.sp,
                    colorFilter:
                        const ColorFilter.mode(Colors.black26, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.h),
            Text(
              'Coming soon...',
              style: TextStyle(
                color: AppColors.titleColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
