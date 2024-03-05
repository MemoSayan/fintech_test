import 'package:fintech_test/core/core.dart';
import 'package:fintech_test/features/analytics/domain/entities/chart_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutSeriesChart extends StatelessWidget {
  const DoughnutSeriesChart({
    super.key,
    required TooltipBehavior tooltip,
    required this.data,
  }) : _tooltip = tooltip;

  final TooltipBehavior _tooltip;
  final List<ChartData> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60.h),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 253, 183, 178),
            spreadRadius: 15,
            blurRadius: 15,
            offset: Offset(0, 3),
          ),
        ],
        shape: BoxShape.circle,
        color: AppColors.primaryLigthBackground,
      ),
      child: Center(
        child: SfCircularChart(
          annotations: <CircularChartAnnotation>[
            CircularChartAnnotation(
              widget: PhysicalModel(
                shape: BoxShape.circle,
                shadowColor: Colors.black,
                color: AppColors.primaryLigthBackground,
                child: SizedBox(
                  width: 210.r,
                  height: 210.r,
                ),
              ),
            ),
            CircularChartAnnotation(
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Junio',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    'Gs.794.556',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 25.sp,
                        color: AppColors.primary),
                  ),
                ],
              ),
            )
          ],
          tooltipBehavior: _tooltip,
          series: <CircularSeries<ChartData, String>>[
            DoughnutSeries<ChartData, String>(
              onPointTap: (point) {
                context.pushNamed(AppRoute.spentAnalyticsDetail.name);
              },
              dataSource: data,
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              radius: '110%',
            )
          ],
        ),
      ),
    );
  }
}