part of 'movements_bloc.dart';

sealed class MovementsState extends Equatable {
  const MovementsState();
  
  @override
  List<Object> get props => [];
}

final class MovementsInitial extends MovementsState {}

final class MovementsLoading extends MovementsState {}

final class MovementsError extends MovementsState {
  const MovementsError(this.message);
  final String message;
  
  @override
  List<Object> get props => [message];
}

final class MovementsLoaded extends MovementsState {
  const MovementsLoaded(this.movements);
  final List<Movement> movements;
  
  @override
  List<Object> get props => [movements];
}
