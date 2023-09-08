

import 'package:payaki/network/model/response/post/post_list_response.dart' as ads;

class PostDetailResponse {
  bool? status;
  int? code;
  String? message;
  Data? data;

  PostDetailResponse({this.status, this.code, this.message, this.data});

  PostDetailResponse.fromJson(Map<String, dynamic> json) {
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
  String? status;
  String? userId;
  String? featured;
  String? urgent;
  String? highlight;
  String? productName;
  String? slug;
  String? description;
  String? category;
  String? subCategory;
  String? price;
  String? negotiable;
  String? phone;
  String? hidePhone;
  String? location;
  String? city;
  String? state;
  String? country;
  String? latlong;
  String? screenShot;
  String? tag;
  String? view;
  String? createdAt;
  String? updatedAt;
  String? expireDate;
  dynamic featuredExpDate;
  dynamic urgentExpDate;
  dynamic highlightExpDate;
  String? adminSeen;
  String? emailed;
  String? hide;
  String? catName;
  String? subCatName;
  String? cityName;
  String? stateName;
  String? countryName;
  String? fullAddress;
  String? postUrl;
  String? chatUrl;
  bool? isFavourite;
  String? expireDays;
  String? expiredDate;
  List<String>? image;
  PostUserDetails? postUserDetails;
  List<ReviewRating>? reviewRating;
 // List<SimilarPost>? similarPost;
  List<ads.Data>? similarPost;

  Data(
      {this.id,
        this.status,
        this.userId,
        this.featured,
        this.urgent,
        this.highlight,
        this.productName,
        this.slug,
        this.description,
        this.category,
        this.subCategory,
        this.price,
        this.negotiable,
        this.phone,
        this.hidePhone,
        this.location,
        this.city,
        this.state,
        this.country,
        this.latlong,
        this.screenShot,
        this.tag,
        this.view,
        this.createdAt,
        this.updatedAt,
        this.expireDate,
        this.featuredExpDate,
        this.urgentExpDate,
        this.highlightExpDate,
        this.adminSeen,
        this.emailed,
        this.hide,
        this.catName,
        this.subCatName,
        this.cityName,
        this.stateName,
        this.countryName,
        this.fullAddress,
        this.postUrl,
        this.chatUrl,
        this.isFavourite,
        this.expireDays,
        this.expiredDate,
        this.image,
        this.postUserDetails,
        this.reviewRating,
        this.similarPost});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    userId = json['user_id'];
    featured = json['featured'];
    urgent = json['urgent'];
    highlight = json['highlight'];
    productName = json['product_name'];
    slug = json['slug'];
    description = json['description'];
    category = json['category'];
    subCategory = json['sub_category'];
    price = json['price'];
    negotiable = json['negotiable'];
    phone = json['phone'];
    hidePhone = json['hide_phone'];
    location = json['location'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    latlong = json['latlong'];
    screenShot = json['screen_shot'];
    tag = json['tag'];
    view = json['view'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    expireDate = json['expire_date'];
    featuredExpDate = json['featured_exp_date'];
    urgentExpDate = json['urgent_exp_date'];
    highlightExpDate = json['highlight_exp_date'];
    adminSeen = json['admin_seen'];
    emailed = json['emailed'];
    hide = json['hide'];
    catName = json['cat_name'];
    subCatName = json['sub_cat_name'];
    cityName = json['city_name'];
    stateName = json['state_name'];
    countryName = json['country_name'];
    fullAddress = json['full_address'];
    postUrl = json['post_url'];
    chatUrl = json['chat_url'];
    isFavourite = json['is_favourite'];
    expireDays = json['expire_days'];
    expiredDate = json['expired_date'];
    image = json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x));

    postUserDetails = json['post_user_details'] != null
        ? new PostUserDetails.fromJson(json['post_user_details'])
        : null;
    if (json['review_rating'] != null) {
      reviewRating = <ReviewRating>[];
      json['review_rating'].forEach((v) {
        reviewRating!.add(new ReviewRating.fromJson(v));
      });
    }
    if (json['similar_post'] != null) {
    //  similarPost = <SimilarPost>[];
      similarPost = <ads.Data>[];
      json['similar_post'].forEach((v) {
        similarPost!.add(new ads.Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['featured'] = this.featured;
    data['urgent'] = this.urgent;
    data['highlight'] = this.highlight;
    data['product_name'] = this.productName;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['category'] = this.category;
    data['sub_category'] = this.subCategory;
    data['price'] = this.price;
    data['negotiable'] = this.negotiable;
    data['phone'] = this.phone;
    data['hide_phone'] = this.hidePhone;
    data['location'] = this.location;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['latlong'] = this.latlong;
    data['screen_shot'] = this.screenShot;
    data['tag'] = this.tag;
    data['view'] = this.view;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['expire_date'] = this.expireDate;
    data['featured_exp_date'] = this.featuredExpDate;
    data['urgent_exp_date'] = this.urgentExpDate;
    data['highlight_exp_date'] = this.highlightExpDate;
    data['admin_seen'] = this.adminSeen;
    data['emailed'] = this.emailed;
    data['hide'] = this.hide;
    data['cat_name'] = this.catName;
    data['sub_cat_name'] = this.subCatName;
    data['city_name'] = this.cityName;
    data['state_name'] = this.stateName;
    data['country_name'] = this.countryName;
    data['full_address'] = this.fullAddress;
    data['post_url'] = this.postUrl;
    data['chat_url'] = this.chatUrl;
    data['is_favourite'] = this.isFavourite;
    data['expire_days'] = this.expireDays;
    data['expired_date'] = this.expiredDate;
    data['image'] = this.image;
    if (this.postUserDetails != null) {
      data['post_user_details'] = this.postUserDetails!.toJson();
    }
    if (this.reviewRating != null) {
      data['review_rating'] =
          this.reviewRating!.map((v) => v.toJson()).toList();
    }
    if (this.similarPost != null) {
      data['similar_post'] = this.similarPost!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostUserDetails {
  String? id;
  String? groupId;
  String? username;
  dynamic userType;
  String? passwordHash;
  String? forgot;
  String? confirm;
  String? email;
  String? status;
  dynamic view;
  String? createdAt;
  String? updatedAt;
  String? name;
  dynamic tagline;
  dynamic description;
  dynamic website;
  dynamic sex;
  dynamic countryCode;
  dynamic phone;
  dynamic postcode;
  dynamic address;
  String? country;
  String? city;
  String? image;
  String? lastactive;
  dynamic facebook;
  dynamic twitter;
  dynamic googleplus;
  dynamic instagram;
  dynamic linkedin;
  dynamic youtube;
  dynamic oauthProvider;
  dynamic oauthUid;
  dynamic oauthLink;
  String? online;
  String? notify;
  dynamic notifyCat;
 dynamic otp;
  String? idProofType;
  String? idProofNumber;
  String? idProof;
  String? addressProofType;
  String? addressProofNumber;
  String? addressProof;

  PostUserDetails(
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

  PostUserDetails.fromJson(Map<String, dynamic> json) {
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

class ReviewRating {
  String? rating;
  String? review;
  String? reviewerName;
  String? reviewDate;

  ReviewRating({this.rating, this.review, this.reviewerName, this.reviewDate});

  ReviewRating.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    review = json['review'];
    reviewerName = json['reviewer_name'];
    reviewDate = json['review_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['reviewer_name'] = this.reviewerName;
    data['review_date'] = this.reviewDate;
    return data;
  }
}
//
// class SimilarPost {
//   String? id;
//   String? status;
//   String? userId;
//   String? featured;
//   String? urgent;
//   String? highlight;
//   String? productName;
//   String? slug;
//   String? description;
//   String? category;
//   String? subCategory;
//   String? price;
//   String? negotiable;
//   String? phone;
//   String? hidePhone;
//   String? location;
//   String? city;
//   String? state;
//   String? country;
//   String? latlong;
//   String? screenShot;
//   String? tag;
//   String? view;
//   String? createdAt;
//   String? updatedAt;
//   String? expireDate;
//   dynamic featuredExpDate;
//   dynamic urgentExpDate;
//   dynamic highlightExpDate;
//   String? adminSeen;
//   String? emailed;
//   String? hide;
//   String? fullAddress;
//   String? expireDays;
//   String? expiredDate;
//   String? isVerified;
//   String? catName;
//   String? subCatName;
//   String? name;
//   List<String>? image;
//
//   SimilarPost(
//       {this.id,
//         this.status,
//         this.userId,
//         this.featured,
//         this.urgent,
//         this.highlight,
//         this.productName,
//         this.slug,
//         this.description,
//         this.category,
//         this.subCategory,
//         this.price,
//         this.negotiable,
//         this.phone,
//         this.hidePhone,
//         this.location,
//         this.city,
//         this.state,
//         this.country,
//         this.latlong,
//         this.screenShot,
//         this.tag,
//         this.view,
//         this.createdAt,
//         this.updatedAt,
//         this.expireDate,
//         this.featuredExpDate,
//         this.urgentExpDate,
//         this.highlightExpDate,
//         this.adminSeen,
//         this.emailed,
//         this.hide,
//         this.fullAddress,
//         this.expireDays,
//         this.expiredDate,
//         this.isVerified,
//         this.catName,
//         this.subCatName,
//         this.name,
//         this.image});
//
//   SimilarPost.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     status = json['status'];
//     userId = json['user_id'];
//     featured = json['featured'];
//     urgent = json['urgent'];
//     highlight = json['highlight'];
//     productName = json['product_name'];
//     slug = json['slug'];
//     description = json['description'];
//     category = json['category'];
//     subCategory = json['sub_category'];
//     price = json['price'];
//     negotiable = json['negotiable'];
//     phone = json['phone'];
//     hidePhone = json['hide_phone'];
//     location = json['location'];
//     city = json['city'];
//     state = json['state'];
//     country = json['country'];
//     latlong = json['latlong'];
//     screenShot = json['screen_shot'];
//     tag = json['tag'];
//     view = json['view'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     expireDate = json['expire_date'];
//     featuredExpDate = json['featured_exp_date'];
//     urgentExpDate = json['urgent_exp_date'];
//     highlightExpDate = json['highlight_exp_date'];
//     adminSeen = json['admin_seen'];
//     emailed = json['emailed'];
//     hide = json['hide'];
//     fullAddress = json['full_address'];
//     expireDays = json['expire_days'];
//     expiredDate = json['expired_date'];
//     isVerified = json['is_verified'];
//     catName = json['cat_name'];
//     subCatName = json['sub_cat_name'];
//     name = json['name'];
//     image = json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x));
//
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['status'] = this.status;
//     data['user_id'] = this.userId;
//     data['featured'] = this.featured;
//     data['urgent'] = this.urgent;
//     data['highlight'] = this.highlight;
//     data['product_name'] = this.productName;
//     data['slug'] = this.slug;
//     data['description'] = this.description;
//     data['category'] = this.category;
//     data['sub_category'] = this.subCategory;
//     data['price'] = this.price;
//     data['negotiable'] = this.negotiable;
//     data['phone'] = this.phone;
//     data['hide_phone'] = this.hidePhone;
//     data['location'] = this.location;
//     data['city'] = this.city;
//     data['state'] = this.state;
//     data['country'] = this.country;
//     data['latlong'] = this.latlong;
//     data['screen_shot'] = this.screenShot;
//     data['tag'] = this.tag;
//     data['view'] = this.view;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['expire_date'] = this.expireDate;
//     data['featured_exp_date'] = this.featuredExpDate;
//     data['urgent_exp_date'] = this.urgentExpDate;
//     data['highlight_exp_date'] = this.highlightExpDate;
//     data['admin_seen'] = this.adminSeen;
//     data['emailed'] = this.emailed;
//     data['hide'] = this.hide;
//     data['full_address'] = this.fullAddress;
//     data['expire_days'] = this.expireDays;
//     data['expired_date'] = this.expiredDate;
//     data['is_verified'] = this.isVerified;
//     data['cat_name'] = this.catName;
//     data['sub_cat_name'] = this.subCatName;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     return data;
//   }
// }

