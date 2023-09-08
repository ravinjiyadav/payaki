class CountryListResponse {
  bool? status;
  int? code;
  String? message;
  List<Data>? data;

  CountryListResponse({this.status, this.code, this.message, this.data});

  CountryListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['Message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['Message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? asciiname;

  Data({
    this.asciiname,
  });

  Data.fromJson(Map<String, dynamic> json) {
    asciiname = json['asciiname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['asciiname'] = this.asciiname;

    return data;
  }
}

