part of 'header_bloc.dart';

enum BalanceStatus { visible, hidden }

class HeaderState extends Equatable {
  const HeaderState({
    this.balanceStatus,
    this.isBalanceVisible,
  });

  final BalanceStatus? balanceStatus;
  final bool? isBalanceVisible;

  HeaderState copyWith({
    BalanceStatus? balanceStatus,
    bool? isBalanceVisible,
  }) {
    return HeaderState(
      balanceStatus: balanceStatus ?? this.balanceStatus,
      isBalanceVisible: isBalanceVisible ?? this.isBalanceVisible,
    );
  }

  @override
  List<Object?> get props => [balanceStatus];
}

final class HeaderInitial extends HeaderState {}

