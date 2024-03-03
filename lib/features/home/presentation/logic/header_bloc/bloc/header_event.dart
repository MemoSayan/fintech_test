part of 'header_bloc.dart';

@immutable
sealed class HeaderEvent {}


class ToggleBalance extends HeaderEvent {
  ToggleBalance(this.isBalanceVisible);
  final bool isBalanceVisible;
}

class GetBalance extends HeaderEvent {
  GetBalance(this.clientId);
  final String clientId;
}
