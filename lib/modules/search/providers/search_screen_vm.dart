import 'package:flutter/cupertino.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/basic_request.dart';
import 'package:payaki/network/model/request/search/search_request.dart'
    as s_request;
import 'package:payaki/network/model/response/post/post_list_response.dart'
    as s_result;
import 'package:payaki/network/repository/LocationRepository.dart';
import 'package:payaki/network/repository/category_repository.dart';
import 'package:payaki/network/repository/search_repository.dart';
import '../../../network/model/response/category/category_list_response.dart'
    as category;
import '../../../network/model/response/location/city_list_response.dart'
    as city;

class SearchScreenVm extends ChangeNotifier {
  final LocationRepository locationRepository = LocationRepository();
  final CategoryRepository categoryRepository = CategoryRepository();
  final SearchRepository searchRepository = SearchRepository();

  List<category.Data>? categoryList;
  List<city.Data>? cityList;

  List<s_result.Data>? searchPostList;

  bool isLoading = true;

  categoryListApi({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    categoryRepository
        .categoryList(BasicRequest(
            name: Endpoints.category.getCategories, param: Param()))
        .then((value) {
      categoryList = value.data;
      isLoading = false;
      notifyListeners();

      logD("category length ${categoryList?.length}");
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

  cityListApi({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    locationRepository
        .cityList(
            BasicRequest(name: Endpoints.location.getCities, param: Param()))
        .then((value) {
      cityList = value.data;
      isLoading = false;
      notifyListeners();

      logD("length ${cityList?.length}");
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

  updateUi() {
    notifyListeners();
  }

  searchPostApi({
    ValueChanged<List<s_result.Data>>? onSuccess,
    ValueChanged<String>? onFailure,
    required s_request.SearchRequest searchRequest,
  }) {
    logD(searchRequest.toJson());
    searchRepository.searchPost(searchRequest).then((value) {
      searchPostList = value.data;
      notifyListeners();

      logD("Length ${searchPostList?.length}");
      if (value.code == 200) {
        onSuccess?.call(searchPostList!);
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("Error $error");
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }
}
