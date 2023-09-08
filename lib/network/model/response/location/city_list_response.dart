class CityListResponse {
  bool? status;
  int? code;
  String? message;
  List<Data>? data;

  CityListResponse({this.status, this.code, this.message, this.data});

  CityListResponse.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? countryCode;
  String? name;
  String? asciiname;
  String? latitude;
  String? longitude;
  String? featureClass;
  String? featureCode;
  String? subadmin1Code;
  String? subadmin2Code;
  String? population;
  String? timeZone;
  String? active;
  String? createdAt;
  String? updatedAt;
  String? stateName;

  Data(
      {this.id,
        this.countryCode,
        this.name,
        this.asciiname,
        this.latitude,
        this.longitude,
        this.featureClass,
        this.featureCode,
        this.subadmin1Code,
        this.subadmin2Code,
        this.population,
        this.timeZone,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.stateName
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryCode = json['country_code'];
    name = json['name'];
    asciiname = json['asciiname'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    featureClass = json['feature_class'];
    featureCode = json['feature_code'];
    subadmin1Code = json['subadmin1_code'];
    subadmin2Code = json['subadmin2_code'];
    population = json['population'];
    timeZone = json['time_zone'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stateName = json['state_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_code'] = this.countryCode;
    data['name'] = this.name;
    data['asciiname'] = this.asciiname;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['feature_class'] = this.featureClass;
    data['feature_code'] = this.featureCode;
    data['subadmin1_code'] = this.subadmin1Code;
    data['subadmin2_code'] = this.subadmin2Code;
    data['population'] = this.population;
    data['time_zone'] = this.timeZone;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['state_name'] = this.stateName;
    return data;
  }
}
