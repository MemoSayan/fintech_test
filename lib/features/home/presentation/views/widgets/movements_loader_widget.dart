import 'package:fintech_test/core/widgets/skeleton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovementsLoader extends StatelessWidget {
  const MovementsLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 30.h),
            Skeleton(
              height: 20.h,
              width: 100.w,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  3, 
              itemBuilder: (context, index) {
                return Column(
                  children: [
                      SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Skeleton(
                              height: 33.w,
                              width: 33.w,
                            ),
                            SizedBox(width: 20.w),
                            Skeleton(
                              height: 25.h,
                              width: 100.w,
                            ),
                          ],
                        ),
                       SizedBox(width: 20.w),
                        Skeleton(
                         height: 25.h,
                          width: 80.w,
                        ),
                      ],
                    ),
                      SizedBox(height: 20.h),
                         Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                           Skeleton(
                              height: 33.h,
                              width: 33.w,
                            ),
                          SizedBox(width: 20.w),
                            Skeleton(
                              height: 25.h,
                              width: 130.w,
                            ),
                          ],
                        ),
                      SizedBox(width: 20.w),
                        Skeleton(
                          height: 25.h,
                          width: 60.w,
                        ),
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
