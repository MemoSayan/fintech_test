import 'package:dio/dio.dart';
import 'package:fintech_test/core/core.dart';
import 'package:fintech_test/core/environment/environment_config.dart';
import 'package:fintech_test/core/injectors/get_it_injectors.config.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getItInjector = GetIt.instance;
@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
@InjectableInit(generateForDir: ['lib/core/injectors'])
Future<void> configureDependencies(String environment) async {
  await _setUpNetWorking(environment);
  getItInjector.init(environment: environment);
}

Future<void> _setUpNetWorking(String environment) async {
  final baseUrl = EnvironmentConfig.apiUrl;
  final dio = Dio();

  dio
    ..interceptors.add(LogInterceptor(requestHeader: true));
  GetIt.I.registerSingleton<Dio>(dio);
  GetIt.I.registerSingleton<NetworkClient>(
    NetworkClient(client: dio),
  );

  GetIt.I.registerSingleton<GlobalKey<NavigatorState>>(
    GlobalKey<NavigatorState>(),
  );

}
