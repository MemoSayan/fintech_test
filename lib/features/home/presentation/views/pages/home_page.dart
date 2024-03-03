import 'package:fintech_test/core/core.dart';
import 'package:fintech_test/features/home/presentation/logic/logic.dart';
import 'package:fintech_test/features/home/presentation/logic/movements_bloc/bloc/movements_bloc.dart';
import 'package:fintech_test/features/home/presentation/views/widgets/bottom_navbar.dart';
import 'package:fintech_test/features/home/presentation/views/widgets/movements_widgets.dart';
import 'package:fintech_test/features/home/presentation/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  bool showBalance = false;

  @override
  Widget build(BuildContext context) {
    context.read<HeaderBloc>().add(GetBalance('123456'));
    context.read<MovementsBloc>().add(const GetMovements('123456'));
    return Scaffold(
        backgroundColor: AppColors.primaryLigthBackground,
        body: CustomScrollView(
          slivers: [
            const CustomSliverAppBar(),
            BlocBuilder<MovementsBloc, MovementsState>(
              builder: (context, state) {
                if (state is MovementsLoading) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is MovementsLoaded) {
                  return MainMovementsWidget(
                    movements: state.movements,
                  );
                }
                if (state is MovementsError) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(state.message),
                    ),
                  );
                } else {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Text('Error'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
        bottomNavigationBar: Theme(data: Theme.of(context).copyWith(
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
          child: const CustomBottomNavigationBar())),
        );
  }
}



