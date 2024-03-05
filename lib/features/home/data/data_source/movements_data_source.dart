import 'package:dartz/dartz.dart';
import 'package:fintech_test/core/core.dart';
import 'package:fintech_test/features/home/data/data.dart';
import 'package:injectable/injectable.dart';

abstract class MovementsDataSource {
  Future<DT<MovementsResponse>> getMovements(String idClient);
}


@Environment('DEV')
@Singleton(as: MovementsDataSource)
class MovementsDataSoure implements MovementsDataSource {
  MovementsDataSoure({required this.networkClient});

  final NetworkClient networkClient;
  
  @override
  Future<DT<MovementsResponse>> getMovements(String idClient) async {
   // const endpoint = '${ApiConstants.servMovements}?';
    return networkClient.post(
      fromJsonFunctionList: MovementsResponse.fromJson,
      path: '/movements',
      queryParameters: {
        'idClient': idClient,
      },
    );  
  }

}

@Environment('MOCK')
@Singleton(as: MovementsDataSource)
class MovementsMockDataSoure implements MovementsDataSource {
  MovementsMockDataSoure({required this.networkClient});

  final NetworkClient networkClient;
  
  @override
  Future<DT<MovementsResponse>> getMovements(String idClient) async {
  await Future.delayed(const Duration(milliseconds: 1200));
   return right(
      MovementsResponse.fromJson(movementsResponseMock),
    );
  }

}