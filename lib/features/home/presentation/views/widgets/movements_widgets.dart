import 'package:fintech_test/core/core.dart';
import 'package:fintech_test/features/home/domain/domain.dart';
import 'package:fintech_test/features/home/domain/entities/type_to_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainMovementsWidget extends StatelessWidget {
  const MainMovementsWidget({
    required this.movements,
    super.key,
  });
  final List<Movement> movements;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Row(
              children: [
                Text(
                  'Movimientos',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: movements.length,
              itemBuilder: (context, index) {
                final movimiento = movements[index];
                final svgPath = typeToSvgPath[movimiento.type] ??
                    'assets/svgs/default_icon.svg';
                return Column(
                  children: [
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(6.r),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: SvgPicture.asset(
                            svgPath,
                            height: 24.sp,
                            width: 24.sp,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Container(
                          width: 130.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movimiento.concept,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                movimiento.type,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.titleColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 50.w),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 90.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      movimiento.amount,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(movimiento.currencyCode,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ],
                                ),
                              ),
                              Text(
                                movimiento.date,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.titleColor,
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
