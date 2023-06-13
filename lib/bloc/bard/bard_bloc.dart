import 'dart:async';

import 'package:bardly_mobile_app/bloc/bard/bard_event.dart';
import 'package:bardly_mobile_app/bloc/bard/bard_state.dart';
import 'package:bardly_mobile_app/data/repository/bard_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class BardBloc extends Bloc<BardEvent, BardState> {
  BardBloc() : super(BardInitial()) {
    on<AskToBardEvent>(_askToBard);
  }
  final BardRepository _bardRepository = BardRepository();

  Future<FutureOr<void>> _askToBard(AskToBardEvent event, Emitter<BardState> emit) async {
    emit(BardWaitingState());

    try {
      final bardResponse = await _bardRepository.askToBard(event.question);
      // emit(const BardErrorState(error: 'updateRequired'));
      emit(BardResponse(model: bardResponse));
    } catch (e) {
      emit(BardErrorState(error: e.toString()));
    }
  }
}
