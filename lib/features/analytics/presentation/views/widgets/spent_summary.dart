import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SpentSummary extends StatelessWidget {
  const SpentSummary({
    super.key,
    required this.path,
    required this.category,
    required this.amount,
  });
  final String path;
  final String category;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 35.sp,
                width: 35.sp,
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                  vertical: 5.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: SvgPicture.asset(
                  path,
                  height: 40.sp,
                  width: 40.sp,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Container(
                width: 90.w,
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}