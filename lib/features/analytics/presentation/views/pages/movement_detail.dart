
import 'package:fintech_test/core/core.dart';
import 'package:fintech_test/features/analytics/presentation/views/views.dart';
import 'package:flutter/material.dart';

class MovementDetailPage extends StatelessWidget {
  const MovementDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryLigthBackground,
      body: CustomScrollView(
        slivers: [
          SliverAppBarMovement(),
          SliverToBoxAdapter(
            child: SpentCategoryDetail(),
          ),
        ],
      ),
    );
  }
}

