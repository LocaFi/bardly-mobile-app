import 'dart:async';

import 'package:bardly_mobile_app/bloc/bard/bard_event.dart';
import 'package:bardly_mobile_app/bloc/bard/bard_state.dart';
import 'package:bardly_mobile_app/controller/project_controller.dart';
import 'package:bardly_mobile_app/data/repository/bard_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class BardBloc extends Bloc<BardEvent, BardState> {
  BardBloc() : super(BardInitial()) {
    on<AskToBardEvent>(_askToBard);
    on<GetSystemVariablesEvent>(_getSystemVariables);
  }
  final BardRepository _bardRepository = BardRepository();
  final ProjectController projectController = Get.put(ProjectController());

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

  Future<FutureOr<void>> _getSystemVariables(GetSystemVariablesEvent event, Emitter<BardState> emit) async {
    emit(BardWaitingState());

    try {
      final getSystemVariables = await _bardRepository.getSystemVariables();
      projectController.setSystemVariables(getSystemVariables);
      // print(getSystemVariables.data?[0].value);
      // print(getSystemVariables.data?[1].value);
      // print(getSystemVariables.data?[2].value);
      emit(GetSystemVariablesState(model: getSystemVariables));
    } catch (e) {
      emit(BardErrorState(error: e.toString()));
    }
  }
}
