import 'package:fintech_test/features/home/presentation/logic/movements_bloc/bloc/movements_bloc.dart';
import 'package:fintech_test/features/home/presentation/views/widgets/custom_sliver_appbar.dart';
import 'package:fintech_test/features/home/presentation/views/widgets/movements_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountSummaryWidget extends StatelessWidget {
  const AccountSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
    );
  }
}


