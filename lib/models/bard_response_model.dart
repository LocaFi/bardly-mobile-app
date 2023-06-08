class BardResponseModel {
  String? status;
  String? message;
  String? requestTime;
  Data? data;

  BardResponseModel({this.status, this.message, this.requestTime, this.data});

  BardResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    requestTime = json['requestTime'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['requestTime'] = requestTime;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? chosenAnswer;
  List<Details>? details;

  Data({this.chosenAnswer, this.details});

  Data.fromJson(Map<String, dynamic> json) {
    chosenAnswer = json['chosenAnswer'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chosenAnswer'] = chosenAnswer;
    if (details != null) {
      data['details'] = details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  String? url;
  String? label;
  String? article;

  Details({this.url, this.label, this.article});

  Details.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    article = json['article'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['article'] = article;
    return data;
  }
}
