import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/basic_request.dart';
import 'package:payaki/network/model/request/category/sub_category_list_request.dart';
import 'package:payaki/network/model/response/category/category_list_response.dart';
import 'package:payaki/network/model/response/category/sub_category_list_response.dart';

class CategoryRepository {

  DioHttpService dioHttpService = DioHttpService();


  Future<CategoryListResponse> categoryList(BasicRequest request) {
    return dioHttpService.post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => CategoryListResponse.fromJson(value));
  }

  Future<SubCategoryListResponse> subCategoryList(
      SubCategoryListRequest request) {
    return dioHttpService.post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => SubCategoryListResponse.fromJson(value));
  }
}
