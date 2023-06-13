import 'package:bardly_mobile_app/models/bard_response_model.dart';
import 'package:equatable/equatable.dart';

import '../../models/get_system_variables_response_model.dart';

abstract class BardState extends Equatable {
  const BardState();
  @override
  List<Object> get props => [];
}

class BardInitial extends BardState {}

class BardWaitingState extends BardState {
  @override
  String toString() => 'BardWaitingState';
}

class BardResponse extends BardState {
  BardResponseModel model;
  BardResponse({required this.model});

  @override
  List<Object> get props => [model];
  @override
  String toString() => 'BardResponse';
}

class BardErrorState extends BardState {
  final String error;
  const BardErrorState({required this.error});
  @override
  List<Object> get props => [error];
  @override
  String toString() => 'BardErrorState';
}

class BardUpdateErrorState extends BardState {
  final BardUpdateError error;
  const BardUpdateErrorState({required this.error});
  @override
  List<Object> get props => [error];
  @override
  String toString() => 'BardUpdateErrorState';
}

class GetSystemVariablesState extends BardState {
  final GetSystemVariables model;
  const GetSystemVariablesState({required this.model});
  @override
  List<Object> get props => [model];
  @override
  String toString() => 'GetSystemVariablesState';
}

class BardUpdateError {
  String? status;
  String? message;
  String? requestTime;
  dynamic data;

  BardUpdateError({this.status, this.message, this.requestTime, this.data});

  BardUpdateError.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    requestTime = json['requestTime'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['requestTime'] = requestTime;
    data['data'] = this.data;
    return data;
  }
}
