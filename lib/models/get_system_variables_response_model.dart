class GetSystemVariables {
  String? status;
  String? message;
  String? requestTime;
  List<Data>? data;

  GetSystemVariables({this.status, this.message, this.requestTime, this.data});

  GetSystemVariables.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    requestTime = json['requestTime'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['requestTime'] = requestTime;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? code;
  String? value;
  String? type;

  Data({this.code, this.value, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    value = json['value'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['value'] = value;
    data['type'] = type;
    return data;
  }
}
