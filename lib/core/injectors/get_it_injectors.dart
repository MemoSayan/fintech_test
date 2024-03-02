import 'package:fintech_test/core/injectors/get_it_injectors.config.dart';
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
  getItInjector.init(environment: environment);
}