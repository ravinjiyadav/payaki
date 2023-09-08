class PostListResponse {
  bool? status;
  int? code;
  String? message;
  List<Data>? data;

  PostListResponse({this.status, this.code, this.message, this.data});

  PostListResponse.fromJson(Map<String, dynamic> json) {
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
  String? featuredExpDate;
  String? urgentExpDate;
  String? highlightExpDate;
  String? adminSeen;
  String? emailed;
  String? hide;
  String? catName;
  String? subCatName;
  String? fullAddress;
  String? expireDays;
  String? expiredDate;
  String? isVerified;
  String? name;
  List<String>? image;

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
        this.fullAddress,
        this.expireDays,
        this.expiredDate,
        this.isVerified,
        this.name,
        this.image});

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
    fullAddress = json['full_address'];
    expireDays = json['expire_days'];
    expiredDate = json['expired_date'];
    isVerified = json['is_verified'];
    name = json['name'];
    image = json['image'].cast<String>();
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
    data['full_address'] = this.fullAddress;
    data['expire_days'] = this.expireDays;
    data['expired_date'] = this.expiredDate;
    data['is_verified'] = this.isVerified;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
