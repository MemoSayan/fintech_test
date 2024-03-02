import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'header_event.dart';
part 'header_state.dart';

@injectable
class HeaderBloc extends Bloc<HeaderEvent, HeaderState> {
  HeaderBloc() : super(HeaderInitial()) {
    on<ToggleBalance>(_onToggleBalance);
  }

  FutureOr<void> _onToggleBalance(
      ToggleBalance event, Emitter<HeaderState> emit) async {
        print('isBalance Visible:  ${event.isBalanceVisible}');
        final isVisible = !event.isBalanceVisible;
    emit(state.copyWith(balanceStatus: isVisible
        ? BalanceStatus.visible
        : BalanceStatus.hidden));
    
      }
}
