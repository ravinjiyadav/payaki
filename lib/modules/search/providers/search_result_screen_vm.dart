import 'package:flutter/cupertino.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/model/request/search/search_request.dart'
    as s_request;
import 'package:payaki/network/model/response/post/post_list_response.dart'
    as s_result;
import 'package:payaki/network/repository/search_repository.dart';

class SearchResultScreenVm extends ChangeNotifier {
  final SearchRepository searchRepository = SearchRepository();

  List<s_result.Data>? searchPostList;

  bool isLoading = true;

  searchPostApi({
    ValueChanged<List<s_result.Data>>? onSuccess,
    ValueChanged<String>? onFailure,
    required s_request.SearchRequest searchRequest,
  }) {
    logD(searchRequest.toJson());
    searchRepository.searchPost(searchRequest).then((value) {
      searchPostList = value.data;
      notifyListeners();

      logD("${searchPostList?.length}");
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
