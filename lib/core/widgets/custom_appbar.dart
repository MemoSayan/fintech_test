import 'package:fintech_test/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
