import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/search/search_request.dart';
import 'package:payaki/network/model/response/post/post_list_response.dart';

class SearchRepository {

  DioHttpService dioHttpService = DioHttpService();


  Future<PostListResponse> searchPost(SearchRequest data) {
    return dioHttpService.post(Endpoints.baseUrl, data:  data.toJson())
        .then((value) => PostListResponse.fromJson(value));
  }

}
