import 'package:dartz/dartz.dart';
import 'package:fintech_test/core/networking/network_client.dart';
import 'package:fintech_test/core/utils/format_helpers.dart';
import 'package:fintech_test/features/home/data/data.dart';
import 'package:fintech_test/features/home/domain/domain.dart';
import 'package:fintech_test/features/home/domain/repositories/movements_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: MovementsRepository)
class MovementsRepositoryImpl implements MovementsRepository {
  MovementsRepositoryImpl(this.formatHelpers,
      {required MovementsDataSource dataSource})
      : _dataSource = dataSource;
  final MovementsDataSource _dataSource;
  final FormatHelpers formatHelpers;
  @override
  Future<DT<List<Movement>>> getMovements(String idClient) async {
    final response = await _dataSource.getMovements(idClient);
    return response.fold(
      left,
      (response) => right(
        response.movements!.map((movement) {
          final formattedAmount =
              formatHelpers.formatAmount(movement.amount, movement.currency);

          return Movement(
            id: movement.id,
            amount: formattedAmount,
            date: movement.createdAt,
            description: movement.description,
            type: movement.category,
            currency: movement.currency,
            concept: movement.description,
            currencyCode: movement.currencyCode,
          );
        }).toList(),
      ),
    );
  }
}
