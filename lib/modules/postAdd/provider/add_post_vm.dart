import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/repository/post_repository.dart';

class AddPostVm extends ChangeNotifier {
  final PostRepository postRepository = PostRepository();

  addPostApi({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
    required List<XFile> images,
    required String productName,
    required String description,
    required int categoryId,
    required int subCategoryId,
    required String price,
    required int negotiable,
    required String location,
    required String city,
    required String country,
    required String latlong,
    required String state,
    required String phone,
    required String availableDays,
    required String tag,
    required String featured,
    required String urgent,
    required String highlight,
    required String? amount,
    required String? currency,
    required String? status,
    required String? paymentId,
  }) async {
    logD("User Id is ${Preference().getUserId()}");

    List<MultipartFile> multiPartList = [];

    for (var a = 0; a < images.length; a++) {
      MultipartFile file = await MultipartFile.fromFile(
        images[a].path,
        filename: images[a].name,
      );
      multiPartList.add(file);
    }
    FormData formData = FormData.fromMap({
      'name': Endpoints.post.addPost,
      'user_id': Preference().getUserId(),
      'product_name': productName,
      'tag': tag,
      'description': description,
      'category': categoryId,
      'sub_category': subCategoryId,
      'price': price,
      'negotiable': negotiable,
      'location': location,
      'city': city,
      'country': country,
      'latlong': latlong,
      'state': state,
      'phone': phone,
      'available_days': availableDays,
      'product_images[]': multiPartList,
      'featured': featured,
      'urgent': urgent,
      'highlight': highlight,

      'amount': amount,
      'currency': currency,
      'status': status,
      'paymentId': paymentId,
      'payment_method': "paypal",

    });
    postRepository.addPost(formData).then((value) {
      notifyListeners();

      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("error $error");
      notifyListeners();

      onFailure?.call("Server Error");
    });
  }

  updateUi() {
    notifyListeners();
  }
}
