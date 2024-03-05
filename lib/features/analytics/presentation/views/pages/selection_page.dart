import 'package:fintech_test/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SelectAnalyticsPage extends StatelessWidget {
  const SelectAnalyticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLigthBackground,
      appBar: const AppBarCustom(
        title: 'Análisis',
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
                  child: SvgPicture.asset(
                    'assets/svgs/analytics_pie.svg',
                    height: 64.sp,
                    width: 64.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 35.h),
            Text(
              '¿Qué deseas revisar?',
              style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary),
            ),
            SizedBox(height: 35.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCategoryBox(
                  'Ingresos',
                  'assets/svgs/money.svg',
                ),
                SizedBox(width: 20.h),
                GestureDetector(
                  onTap: () {
                    //goRouter.go(AppRoute.spentAnalytics);
                         context.pushNamed(AppRoute.spentAnalytics.name);
                  },
                  child: _buildCategoryBox('Gastos', 'assets/svgs/card.svg')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryBox(String title, String svgPath) {
    return Container(
      width: 130.h,
      height: 130.h,
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(5.r),
            child: SvgPicture.asset(
              svgPath,
              height: 50.sp,
              width: 50.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}

