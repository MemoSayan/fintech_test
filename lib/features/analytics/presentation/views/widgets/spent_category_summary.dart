import 'package:fintech_test/core/routes/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SpentCategorySummary extends StatelessWidget {
  const SpentCategorySummary({
    super.key,
    required this.path,
    required this.category,
    required this.amount, required this.description, required this.date,
  });
  final String path;
  final String category;
  final String amount;
  final String description;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 4.h),
      child: GestureDetector(
        onTap: () =>  context.pushNamed(AppRoute.movementDetail.name),
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
                  width: 12.w,
                ),
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 110.w,
                      child: Text(
                        category,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                     Container(
                      width: 120.w,
                      child: Text(
                        description,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  amount,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                 Text(
                  date,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                      color: Colors.black54
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}