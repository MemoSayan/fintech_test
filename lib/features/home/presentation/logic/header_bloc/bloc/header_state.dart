part of 'header_bloc.dart';

enum BalanceStatus { visible, hidden }

class HeaderState extends Equatable {
  const HeaderState({
    this.balanceStatus,
    this.isBalanceVisible,
    this.balance,
  });

  final BalanceStatus? balanceStatus;
  final bool? isBalanceVisible;
  final String? balance;

  HeaderState copyWith({
    BalanceStatus? balanceStatus,
    bool? isBalanceVisible,
    String? balance,
  }) {
    return HeaderState(
      balanceStatus: balanceStatus ?? this.balanceStatus,
      isBalanceVisible: isBalanceVisible ?? this.isBalanceVisible,
      balance: balance ?? this.balance,
    );
  }

  @override
  List<Object?> get props => [balanceStatus];
}

final class HeaderInitial extends HeaderState {}

