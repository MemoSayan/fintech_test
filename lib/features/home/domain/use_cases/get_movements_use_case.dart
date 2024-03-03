import 'package:fintech_test/core/core.dart';
import 'package:fintech_test/features/home/domain/domain.dart';
import 'package:fintech_test/features/home/domain/repositories/movements_repository.dart';
import 'package:injectable/injectable.dart';

abstract class GetMovementsUseCase {
  Future<DT<List<Movement>>> getMovements(String idClient);
}

@Singleton(as: GetMovementsUseCase)
class GetMovementsUseCaseImpl implements GetMovementsUseCase {
  GetMovementsUseCaseImpl({required this.repository});
  final MovementsRepository repository;
  @override
  Future<DT<List<Movement>>> getMovements(String idClient) async {
    return repository.getMovements(idClient);
  }
}