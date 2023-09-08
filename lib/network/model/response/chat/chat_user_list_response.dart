class ChatUserListResponse {
  bool? status;
  int? code;
  String? message;
  List<Data>? data;

  ChatUserListResponse({this.status, this.code, this.message, this.data});

  ChatUserListResponse.fromJson(Map<String, dynamic> json) {
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
  String? username;
  String? chatUrl;
  String? image;
  String? lastMessage;
  String? lastMessageTime;

  Data(
      {this.id,
        this.username,
        this.chatUrl,
        this.image,
        this.lastMessage,
        this.lastMessageTime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    chatUrl = json['chat_url'];
    image = json['image'];
    lastMessage = json['last_message'];
    lastMessageTime = json['last_message_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['chat_url'] = this.chatUrl;
    data['image'] = this.image;
    data['last_message'] = this.lastMessage;
    data['last_message_time'] = this.lastMessageTime;
    return data;
  }
}
