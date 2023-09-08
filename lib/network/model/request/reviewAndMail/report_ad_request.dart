class ReportAdRequest {
  String? name;
  Param? param;

  ReportAdRequest({this.name, this.param});

  ReportAdRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    param = json['param'] != null ? new Param.fromJson(json['param']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.param != null) {
      data['param'] = this.param!.toJson();
    }
    return data;
  }
}

class Param {
  String? name;
  String? email;
  String? username;
  String? violationType;
  String? otherPersonName;
  String? violationUrl;
  String? violationDetails;

  Param(
      {this.name,
        this.email,
        this.username,
        this.violationType,
        this.otherPersonName,
        this.violationUrl,
        this.violationDetails});

  Param.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    username = json['username'];
    violationType = json['violation_type'];
    otherPersonName = json['other_person_name'];
    violationUrl = json['violation_url'];
    violationDetails = json['violation_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['violation_type'] = this.violationType;
    data['other_person_name'] = this.otherPersonName;
    data['violation_url'] = this.violationUrl;
    data['violation_details'] = this.violationDetails;
    return data;
  }
}
