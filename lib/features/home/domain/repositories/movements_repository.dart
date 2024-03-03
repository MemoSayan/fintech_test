import 'package:fintech_test/core/core.dart';
import 'package:fintech_test/features/home/data/data.dart';
import 'package:fintech_test/features/home/domain/domain.dart';

abstract class MovementsRepository {
  Future<DT<List<Movement>>>getMovements(String idClient);
}