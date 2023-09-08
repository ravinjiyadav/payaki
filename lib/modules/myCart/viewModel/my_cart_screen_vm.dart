import 'package:flutter/cupertino.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/basic_request.dart' as basic;
import 'package:payaki/network/model/request/cart/add_and_remove_cart_request.dart';
import 'package:payaki/network/model/response/cart/cart_list_response.dart';
import 'package:payaki/network/repository/cart_repository.dart';

import '../../../network/model/request/cart/checkout_request.dart'
as checkout;

class MyCartScreenVm extends ChangeNotifier {
  final CartRepository cartRepository = CartRepository();

  CartListResponse? cartListResponse;
  bool isLoading = true;

  cartList({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    isLoading = true;
    cartRepository
        .cartList(basic.BasicRequest(
            name: Endpoints.cartEndPoints.getCartItems, param: basic.Param()))
        .then((value) {
      cartListResponse = value;
      isLoading = false;
      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
      notifyListeners();
    }).onError((error, stackTrace) {
      logE("error $error");
      notifyListeners();
      isLoading = false;
      onFailure?.call(error.toString());
    });
  }

  removeFromCart({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
    required String? postId,
    required int index,
  }) {
    cartRepository
        .addAndRemoveToCart(AddAndRemoveCartRequest(
            name: Endpoints.cartEndPoints.deleteFromCart,
            param: Param(productId: postId)))
        .then((value) {
      if (value.code == 200) {
        cartListResponse?.data?.products?.removeAt(index);
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
      notifyListeners();
    }).onError((error, stackTrace) {
      logE("error $error");
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }


  checkoutCart({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
    required checkout.CheckoutRequest request,
  }) {
    cartRepository
        .checkoutCart(request)
        .then((value) {
      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
      notifyListeners();
    }).onError((error, stackTrace) {
      logE("error $error");
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }









}
