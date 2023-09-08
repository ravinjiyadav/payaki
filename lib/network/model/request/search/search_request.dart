class SearchRequest {
  String? name;
  Param? param;

  SearchRequest({this.name, this.param});

  SearchRequest.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? category;
  String? subCategory;
  String? location;
  String? city;
  String? state;
  String? country;
  String? priceto;
  String? pricefrom;
  String? sortbyfieldname;
  String? listingType;

  Param({
    this.title,
    this.category,
    this.subCategory,
    this.location,
    this.city,
    this.state,
    this.country,
    this.priceto,
    this.pricefrom,
    this.sortbyfieldname,
    this.listingType,
  });

  Param.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    category = json['category'];
    subCategory = json['sub_category'];
    location = json['location'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    priceto = json['priceto'];
    pricefrom = json['pricefrom'];
    sortbyfieldname = json['sortbyfieldname'];
    listingType = json['listing_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['category'] = this.category;
    data['sub_category'] = this.subCategory;
    data['location'] = this.location;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['priceto'] = this.priceto;
    data['pricefrom'] = this.pricefrom;
    data['sortbyfieldname'] = this.sortbyfieldname;
    data['listing_type'] = this.listingType;
    return data;
  }
}
