// class SignUpRequest {
//   String? name;
//   Param? param;
//
//   SignUpRequest({this.name, this.param});
//
//   SignUpRequest.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     param = json['param'] != null ? new Param.fromJson(json['param']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     if (this.param != null) {
//       data['param'] = this.param!.toJson();
//     }
//     return data;
//   }
// }

import 'package:dio/dio.dart';

class SignUpRequest {
  String? name;
  String? fullName;
  String? userName;
  String? email;
  String? phone;
  String? countryCode;
  String? pass;
  String? idProofType;
  String? idProofNumber;
  MultipartFile? idProof;
  String? deviceToken;
  String? deviceType;

  SignUpRequest({this.name,this.fullName, this.userName, this.email, this.phone,this.countryCode,
    this.pass,
    this.idProofType,
    this.idProofNumber,
    this.idProof,
    this.deviceToken, this.deviceType});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fullName = json['full_name'];
    userName = json['user_name'];
    email = json['email'];
    phone = json['phone'];
    countryCode = json['country_code'];
    pass = json['pass'];
    idProofType = json['id_proof_type'];
    idProofNumber = json['id_proof_number'];
    idProof = json['id_proof'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['country_code'] = this.countryCode;
    data['pass'] = this.pass;
    data['id_proof_type'] = this.idProofType;
    data['id_proof_number'] = this.idProofNumber;
    data['id_proof'] = this.idProof;
    data['device_token'] = this.deviceToken;
    data['device_type'] = this.deviceType;
    return data;
  }
}
