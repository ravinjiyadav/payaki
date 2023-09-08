class TransactionListResponse {
  bool? status;
  int? code;
  String? message;
  List<Data>? data;

  TransactionListResponse({this.status, this.code, this.message, this.data});

  TransactionListResponse.fromJson(Map<String, dynamic> json) {
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
  String? productName;
  String? amount;
  String? featured;
  String? urgent;
  String? highlight;
  String? transactionTime;
  String? status;
  String? transactionGatway;
  String? invoiceUrl;

  Data(
      {this.productName,
        this.amount,
        this.featured,
        this.urgent,
        this.highlight,
        this.transactionTime,
        this.status,
        this.transactionGatway,
        this.invoiceUrl});

  Data.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    amount = json['amount'];
    featured = json['featured'];
    urgent = json['urgent'];
    highlight = json['highlight'];
    transactionTime = json['transaction_time'];
    status = json['status'];
    transactionGatway = json['transaction_gatway'];
    invoiceUrl = json['invoice_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['amount'] = this.amount;
    data['featured'] = this.featured;
    data['urgent'] = this.urgent;
    data['highlight'] = this.highlight;
    data['transaction_time'] = this.transactionTime;
    data['status'] = this.status;
    data['transaction_gatway'] = this.transactionGatway;
    data['invoice_url'] = this.invoiceUrl;
    return data;
  }
}
