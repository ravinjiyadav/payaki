import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/basic_request.dart';
import 'package:payaki/network/model/response/chat/chat_user_list_response.dart';

class ChatRepository {

  DioHttpService dioHttpService = DioHttpService();

  Future<ChatUserListResponse> chatUserList(BasicRequest request) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => ChatUserListResponse.fromJson(value));
  }





}
