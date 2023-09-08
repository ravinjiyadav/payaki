class UserProfileResponse {
  bool? status;
  int? code;
  String? message;
  Data? data;

  UserProfileResponse({this.status, this.code, this.message, this.data});

  UserProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['Message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['Message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? groupId;
  String? username;
  var userType;
  String? passwordHash;
 var forgot;
  String? confirm;
  String? email;
  String? status;
  var view;
  String? createdAt;
  String? updatedAt;
  String? name;
  var tagline;
  var description;
  String? website;
  var sex;
  String? countryCode;
  String? phone;
  String? postcode;
  String? address;
  String? country;
  String? city;
  String? image;
  String? lastactive;
  String? facebook;
  String? twitter;
  String? googleplus;
  String? instagram;
  String? linkedin;
  String? youtube;
  String? oauthProvider;
  String? oauthUid;
  String? oauthLink;
  String? online;
  String? notify;
  String? notifyCat;
  String? otp;
  String? idProofType;
  String? idProofNumber;
  String? idProof;
  String? addressProofType;
  String? addressProofNumber;
  String? addressProof;

  Data(
      {this.id,
        this.groupId,
        this.username,
        this.userType,
        this.passwordHash,
        this.forgot,
        this.confirm,
        this.email,
        this.status,
        this.view,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.tagline,
        this.description,
        this.website,
        this.sex,
        this.countryCode,
        this.phone,
        this.postcode,
        this.address,
        this.country,
        this.city,
        this.image,
        this.lastactive,
        this.facebook,
        this.twitter,
        this.googleplus,
        this.instagram,
        this.linkedin,
        this.youtube,
        this.oauthProvider,
        this.oauthUid,
        this.oauthLink,
        this.online,
        this.notify,
        this.notifyCat,
        this.otp,
        this.idProofType,
        this.idProofNumber,
        this.idProof,
        this.addressProofType,
        this.addressProofNumber,
        this.addressProof});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group_id'];
    username = json['username'];
    userType = json['user_type'];
    passwordHash = json['password_hash'];
    forgot = json['forgot'];
    confirm = json['confirm'];
    email = json['email'];
    status = json['status'];
    view = json['view'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    tagline = json['tagline'];
    description = json['description'];
    website = json['website'];
    sex = json['sex'];
    countryCode = json['country_code'];
    phone = json['phone'];
    postcode = json['postcode'];
    address = json['address'];
    country = json['country'];
    city = json['city'];
    image = json['image'];
    lastactive = json['lastactive'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    googleplus = json['googleplus'];
    instagram = json['instagram'];
    linkedin = json['linkedin'];
    youtube = json['youtube'];
    oauthProvider = json['oauth_provider'];
    oauthUid = json['oauth_uid'];
    oauthLink = json['oauth_link'];
    online = json['online'];
    notify = json['notify'];
    notifyCat = json['notify_cat'];
    otp = json['otp'];
    idProofType = json['id_proof_type'];
    idProofNumber = json['id_proof_number'];
    idProof = json['id_proof'];
    addressProofType = json['address_proof_type'];
    addressProofNumber = json['address_proof_number'];
    addressProof = json['address_proof'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['group_id'] = this.groupId;
    data['username'] = this.username;
    data['user_type'] = this.userType;
    data['password_hash'] = this.passwordHash;
    data['forgot'] = this.forgot;
    data['confirm'] = this.confirm;
    data['email'] = this.email;
    data['status'] = this.status;
    data['view'] = this.view;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['tagline'] = this.tagline;
    data['description'] = this.description;
    data['website'] = this.website;
    data['sex'] = this.sex;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['postcode'] = this.postcode;
    data['address'] = this.address;
    data['country'] = this.country;
    data['city'] = this.city;
    data['image'] = this.image;
    data['lastactive'] = this.lastactive;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['googleplus'] = this.googleplus;
    data['instagram'] = this.instagram;
    data['linkedin'] = this.linkedin;
    data['youtube'] = this.youtube;
    data['oauth_provider'] = this.oauthProvider;
    data['oauth_uid'] = this.oauthUid;
    data['oauth_link'] = this.oauthLink;
    data['online'] = this.online;
    data['notify'] = this.notify;
    data['notify_cat'] = this.notifyCat;
    data['otp'] = this.otp;
    data['id_proof_type'] = this.idProofType;
    data['id_proof_number'] = this.idProofNumber;
    data['id_proof'] = this.idProof;
    data['address_proof_type'] = this.addressProofType;
    data['address_proof_number'] = this.addressProofNumber;
    data['address_proof'] = this.addressProof;
    return data;
  }
}
