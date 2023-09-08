class UpdateProfileRequest {
  String? name;
  String? username;
  String? address;
  String? country;
  String? description;
  String? website;
  String? facebook;
  String? twitter;
  String? googleplus;
  String? instagram;
  String? linkedin;
  String? youtube;

  UpdateProfileRequest(
      {
        this.name,
        this.username,
        this.address,
        this.country,
        this.description,
        this.website,
        this.facebook,
        this.twitter,
        this.googleplus,
        this.instagram,
        this.linkedin,
        this.youtube
      });

  UpdateProfileRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    address = json['address'];
    country = json['country'];
    description = json['description'];
    website = json['website'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    googleplus = json['googleplus'];
    instagram = json['instagram'];
    linkedin = json['linkedin'];
    youtube = json['youtube'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['address'] = this.address;
    data['country'] = this.country;
    data['description'] = this.description;
    data['website'] = this.website;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['googleplus'] = this.googleplus;
    data['instagram'] = this.instagram;
    data['linkedin'] = this.linkedin;
    data['youtube'] = this.youtube;
    return data;
  }
}

