part of 'movements_bloc.dart';

sealed class MovementsEvent extends Equatable {
  const MovementsEvent();

  @override
  List<Object> get props => [];
}


class GetMovements extends MovementsEvent {
  const GetMovements(this.accountNumber);
  final String accountNumber;
  
  @override
  List<Object> get props => [accountNumber];
}
