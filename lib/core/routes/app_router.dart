import 'package:fintech_test/core/routes/list_routers.dart';
import 'package:fintech_test/features/analytics/presentation/views/pages/pages.dart';
import 'package:fintech_test/features/home/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      pageBuilder: (context, state) => MaterialPage(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<HeaderBloc>(
              create: (context) => GetIt.I.get<HeaderBloc>(),
            ),
            BlocProvider<MovementsBloc>(
              create: (context) => GetIt.I.get<MovementsBloc>(),
            ),
          ],
          child: HomePage(),
        ),
      ),
      routes: [
        GoRoute(
          path: 'spent-analytics',
          name: AppRoute.spentAnalytics.name,
          pageBuilder: (context, state) => MaterialPage(
            child: SpentAnalysis(),
          ),
        ),
        GoRoute(
          path: 'spent-details',
          name: AppRoute.spentAnalyticsDetail.name,
          pageBuilder: (context, state) => MaterialPage(
            child: SpentDetails(),
          ),
        ),
        GoRoute(
          path: 'movement-detail',
          name: AppRoute.movementDetail.name,
          pageBuilder: (context, state) =>  MaterialPage(
            child: MovementDetailPage(),
          ),
        ),
      ],
    ),

  ],
);
