// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/home/data/data.dart' as _i9;
import '../../features/home/data/data_source/movements_data_source.dart' as _i5;
import '../../features/home/data/repositories/movements_repository_impl.dart'
    as _i8;
import '../../features/home/domain/domain.dart' as _i7;
import '../../features/home/domain/use_cases/get_movements_use_case.dart'
    as _i10;
import '../../features/home/presentation/logic/header_bloc/bloc/header_bloc.dart'
    as _i4;
import '../../features/home/presentation/logic/movements_bloc/bloc/movements_bloc.dart'
    as _i11;
import '../core.dart' as _i6;
import '../utils/format_helpers.dart' as _i3;

const String _DEV = 'DEV';
const String _MOCK = 'MOCK';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.FormatHelpers>(_i3.FormatHelpers());
    gh.factory<_i4.HeaderBloc>(() => _i4.HeaderBloc());
    gh.singleton<_i5.MovementsDataSource>(
      _i5.MovementsMockDataSoure(networkClient: gh<_i6.NetworkClient>()),
      registerFor: {
        _DEV,
        _MOCK,
      },
    );
    gh.singleton<_i7.MovementsRepository>(_i8.MovementsRepositoryImpl(
      gh<_i3.FormatHelpers>(),
      dataSource: gh<_i9.MovementsDataSource>(),
    ));
    gh.singleton<_i10.GetMovementsUseCase>(_i10.GetMovementsUseCaseImpl(
        repository: gh<_i7.MovementsRepository>()));
    gh.factory<_i11.MovementsBloc>(
        () => _i11.MovementsBloc(gh<_i10.GetMovementsUseCase>()));
    return this;
  }
}
