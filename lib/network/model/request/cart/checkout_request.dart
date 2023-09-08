class CheckoutRequest {
  String? name;
  Param? param;

  CheckoutRequest({this.name, this.param});

  CheckoutRequest.fromJson(Map<String, dynamic> json) {
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
  List<String>? productIds;
  List<String>? amounts;
  int? totalAmount;
  String? paymentId;
  String? payerId;
  String? status;

  Param(
      {this.productIds,
      this.amounts,
      this.totalAmount,
      this.paymentId,
      this.payerId,
      this.status});

  Param.fromJson(Map<String, dynamic> json) {
    productIds = json['productIds'].cast<String>();
    amounts = json['amounts'].cast<String>();
    totalAmount = json['totalAmount'];
    paymentId = json['paymentId'];
    payerId = json['payer_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productIds'] = this.productIds;
    data['amounts'] = this.amounts;
    data['totalAmount'] = this.totalAmount;
    data['paymentId'] = this.paymentId;
    data['payer_id'] = this.payerId;
    data['status'] = this.status;
    return data;
  }
}
