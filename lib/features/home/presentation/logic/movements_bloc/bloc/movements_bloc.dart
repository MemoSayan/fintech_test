import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fintech_test/features/home/domain/entities/movement.dart';
import 'package:fintech_test/features/home/domain/use_cases/get_movements_use_case.dart';
import 'package:injectable/injectable.dart';

part 'movements_event.dart';
part 'movements_state.dart';

@Injectable()
class MovementsBloc extends Bloc<MovementsEvent, MovementsState> {
  MovementsBloc(this.getMovementsUseCase) : super(MovementsInitial()) {
    on<GetMovements>(_onGetMovements);
  }

  final GetMovementsUseCase getMovementsUseCase;

  FutureOr<void> _onGetMovements(
    GetMovements event,
    Emitter<MovementsState> emit,
  ) async {
    emit(MovementsLoading());
    final response =
        await getMovementsUseCase.getMovements(event.accountNumber);
    response.fold(
      (failure) => emit(MovementsError(failure.message)),
      (movements) { emit(MovementsLoaded(movements));
      print(movements); }
      );
    
  }
}
