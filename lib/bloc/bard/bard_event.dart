import 'package:bardly_mobile_app/models/bard_request_model.dart';

abstract class BardEvent {}

class AskToBardEvent extends BardEvent {
  BardRequestModel question;
  AskToBardEvent(this.question);
  @override
  List<Object> get props => [question];

  @override
  String toString() {
    print('AskToBardEvent _> Calling...');
    return super.toString();
  }
}

class GetListEventsDetailByIdEvent extends BardEvent {
  String id;
  GetListEventsDetailByIdEvent(this.id);
  @override
  List<Object> get props => [id];

  @override
  String toString() {
    print('GetListEventsDetailByIdEvent _> Calling...');
    return super.toString();
  }
}
