import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/basic_request.dart';
import 'package:payaki/network/model/request/cart/add_and_remove_cart_request.dart';
import 'package:payaki/network/model/request/cart/checkout_request.dart';
import 'package:payaki/network/model/request/post/like_dislike_post_request.dart';
import 'package:payaki/network/model/request/post/post_detail_request.dart';
import 'package:payaki/network/model/request/post/post_list_request.dart';
import 'package:payaki/network/model/response/basic_response.dart';
import 'package:payaki/network/model/response/cart/cart_list_response.dart';
import 'package:payaki/network/model/response/post/post_detail_response.dart';
import 'package:payaki/network/model/response/post/premium_and_latest_post_response.dart';
import 'package:payaki/network/model/response/post/post_list_response.dart';

class CartRepository {
  DioHttpService dioHttpService = DioHttpService();

  Future<BasicResponse> addAndRemoveToCart(AddAndRemoveCartRequest request) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => BasicResponse.fromJson(value));
  }

  Future<CartListResponse> cartList(BasicRequest request) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => CartListResponse.fromJson(value));
  }

  Future<BasicResponse> checkoutCart(CheckoutRequest request) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => BasicResponse.fromJson(value));
  }
}
