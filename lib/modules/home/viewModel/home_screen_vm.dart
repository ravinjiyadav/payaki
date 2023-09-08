import 'package:flutter/cupertino.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/basic_request.dart';
import 'package:payaki/network/model/response/category/category_list_response.dart' as category;
import 'package:payaki/network/model/response/post/premium_and_latest_post_response.dart';
import 'package:payaki/network/repository/category_repository.dart';
import 'package:payaki/network/repository/post_repository.dart';

import 'package:payaki/network/model/request/search/search_request.dart' as s_request;
import 'package:payaki/network/model/response/post/post_list_response.dart' as s_result;
import 'package:payaki/network/repository/search_repository.dart';

class HomeScreenVm extends ChangeNotifier {
  final CategoryRepository categoryRepository = CategoryRepository();
  final PostRepository postRepository = PostRepository();
  final SearchRepository searchRepository = SearchRepository();


  List<category.Data>? categoryList;
  PremiumAndLatestPostResponse? premiumAndLatestPost;
  bool isCategoryLoading = true;
  bool isPremiumAndLatestPostLoading = true;

  List<s_result.Data>? searchPostList;


  fetchCategoryList({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    categoryRepository
        .categoryList(BasicRequest(
        name: Endpoints.category.getCategories, param: Param()))
        .then((value) {
      categoryList = value.data;
      isCategoryLoading = false;
      notifyListeners();
      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("error $error");
      isCategoryLoading = false;
      notifyListeners();
      onFailure?.call("Server Error");
    });
  }


  fetchPremiumAndLatestPost({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    postRepository
        .premiumAndLatestPost(BasicRequest(
        name: Endpoints.post.premiumAndLatestPost, param: Param()))
        .then((value) {
      premiumAndLatestPost = value;
      isPremiumAndLatestPostLoading = false;
      notifyListeners();
      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("error $error");
      isPremiumAndLatestPostLoading = false;
      notifyListeners();
      onFailure?.call("Server Error");
    });
  }


  searchPostApi({
    ValueChanged<List<s_result.Data>>? onSuccess,
    ValueChanged<String>? onFailure,
    required s_request.SearchRequest searchRequest,
  }) {

    logD(searchRequest.toJson());
    searchRepository
        .searchPost(searchRequest)
        .then((value) {

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

      onFailure?.call("Server Error");
    });
  }










}
