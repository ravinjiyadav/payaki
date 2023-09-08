import 'package:flutter/cupertino.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/category/sub_category_list_request.dart';
import 'package:payaki/network/repository/category_repository.dart';
import 'package:payaki/network/model/response/category/sub_category_list_response.dart';

class SubCategoryScreenVm extends ChangeNotifier {
  final CategoryRepository categoryRepository = CategoryRepository();

  List<Data>? subCategoryList;
  bool isLoading = true;

  subCategoryListApi({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
    required int catId,
  }) {
    categoryRepository
        .subCategoryList(SubCategoryListRequest(
            name: Endpoints.category.getSubCategories,
            param: Param(categoryId: catId)))
        .then((value) {
      subCategoryList = value.data;
      isLoading = false;
      notifyListeners();

      logD("category length ${subCategoryList?.length}");
      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("error $error");
      isLoading = false;
      notifyListeners();

      onFailure?.call("Server Error");
    });
  }
}
