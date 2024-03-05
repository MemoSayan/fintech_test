import 'package:fintech_test/core/core.dart';
import 'package:fintech_test/features/analytics/domain/entities/chart_data.dart';
import 'package:fintech_test/features/analytics/presentation/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SpentDetails extends StatefulWidget {
  @override
  _SpentDetails createState() => _SpentDetails();
}

class _SpentDetails extends State<SpentDetails> {
  late List<ChartData> data;
  late TooltipBehavior _tooltip;
  List<String> months = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre',
  ];

  @override
  void initState() {
    data = [
      ChartData('David', 120, AppColors.restaurants, Icons.restaurant),
      /* ChartData('b', 10, AppColors.health, Icons.local_hospital),
      ChartData('a', 30, AppColors.entertainment, Icons.local_movies),
      ChartData('Steve', 40, AppColors.atm, Icons.atm),
      ChartData('c', 40, AppColors.transport, Icons.directions_bus),
      ChartData('Jack', 50, AppColors.shopping, Icons.shopping_cart),
      ChartData('d', 30, AppColors.others, Icons.more_horiz), */
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  int selectedMonthIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLigthBackground,
      appBar: AppBarCustom(
        title: 'Gastos',
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(months.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMonthIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: index == selectedMonthIndex
                              ? AppColors.primary
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      months[index],
                      style: TextStyle(
                        color: index == selectedMonthIndex
                            ? AppColors.primary
                            : Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          // Gráfica de tipo dona
          Column(
            children: [
              Stack(
                children: [
                  DoughnutSeriesChart(tooltip: _tooltip, data: data),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.23.h,
                    left: MediaQuery.of(context).size.width * 0.73.w,
                    child: SvgPicture.asset(
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      'assets/svgs/food_icon.svg',
                      height: 28.sp,
                      width: 28.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.w,
              ),
              const SpentCategorySummary(
                path: 'assets/svgs/food_icon.svg',
                category: 'EL CAFE DE ACA',
                amount: 'Gs. 420.000',
                  description: 'Restaurantes y bares',
                  date: '12/12/2021'
              ),
              const SpentCategorySummary(
                path: 'assets/svgs/food_icon.svg',
                category: 'DINERAMA PY',
                amount: 'Gs. 420.000',
                description: 'Restaurantes y bares',
                date: '12/12/2021'
              ),
              const SpentCategorySummary(
                path: 'assets/svgs/food_icon.svg',
                category: 'DINERAMA PY',
                amount: 'Gs. 420.000',
                  description: 'Restaurantes y bares',
                  date: '12/12/2021'
              ),
              const PrimaryButtom(
                title: 'Ver detalles',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
