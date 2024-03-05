import 'package:fintech_test/core/core.dart';
import 'package:fintech_test/core/widgets/coming_soon.dart';
import 'package:fintech_test/features/analytics/presentation/views/pages/selection_page.dart';
import 'package:fintech_test/features/analytics/presentation/views/pages/spent_analytics.dart';
import 'package:fintech_test/features/home/presentation/logic/logic.dart';
import 'package:fintech_test/features/home/presentation/logic/movements_bloc/bloc/movements_bloc.dart';
import 'package:fintech_test/features/home/presentation/views/widgets/account_summary_widget.dart';
import 'package:fintech_test/features/home/presentation/views/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showBalance = false;
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void onTabTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    print('Ítem tocado: $index');
  }

  @override
  Widget build(BuildContext context) {
    context.read<HeaderBloc>().add(GetBalance('123456'));
    context.read<MovementsBloc>().add(const GetMovements('123456'));
    return Scaffold(
      backgroundColor: AppColors.primaryLigthBackground,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
          _currentIndex = index;
          });
        },
        children:  [
          AccountSummaryWidget(),
        ComingSoonPage(),
        
          SelectAnalyticsPage(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColors.primaryLigthBackground,
          splashColor: AppColors.secondary.withOpacity(0.2),
        ),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.secondaryLigthBackground,
                spreadRadius: 10,
                blurRadius: 20,
                offset: Offset(0, -1),
              ),
            ],
          ),
          child: CustomBottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: _currentIndex,
          ),
        ),
      ),
    );
  }
}
