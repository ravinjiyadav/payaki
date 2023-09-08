import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:payaki/logger/app_logger.dart';

class PayPalPayment {
  String clientId =
      "AVpFDyu8miaS4QtS2pzBa0l-KGmCOy9cGCIZavQOs5ev7YSeSMd-WExl_jTNUtGhRqGdSuEh73dJ90Yi";
  String secretKey =
      "EMpw5WwZ__n2YemFw2fo82VriBb753vwR7FgXUhoNp7u34w6oMLGZlJOklXdwjNoxeT8AxlZph2irRG8";

  pay({
    required BuildContext context,
    required String amount,
    required ValueChanged<Map> onSuccess,
    required ValueChanged<String> onFailure,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => UsePaypal(
            sandboxMode: true,
            clientId: clientId,
            secretKey: secretKey,
            returnURL: "https://samplesite.com/return",
            cancelURL: "https://samplesite.com/cancel",
            transactions: [
              {
                "amount": {
                  "total": amount,
                  "currency": "USD",
                  "details": {
                    "subtotal": amount,
                    "shipping": '0',
                    "shipping_discount": 0
                  }
                },
                "description": "The payment transaction description.",

                // "item_list": {
                //   "items": [
                //     {
                //       "name": "A demo product",
                //       "quantity": 1,
                //       "price": '9',
                //       "currency": "USD"
                //     }
                //   ],

                //   shipping address is not required though

                // "shipping_address": const {
                //   "recipient_name": "Jane Foster",
                //   "line1": "Travis County",
                //   "line2": "",
                //   "city": "Austin",
                //   "country_code": "US",
                //   "postal_code": "73301",
                //   "phone": "+00000000",
                //   "state": "Texas"
                // },
              }
            ],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              // logD("onSuccess: $params");
              onSuccess.call(params);
            },
            onError: (error) {
              //
              onFailure.call("$error");
            },
            onCancel: (params) {
              logD('cancelled: $params');
            }),
      ),
    );
  }
}
