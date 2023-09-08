import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/basic_request.dart';
import 'package:payaki/network/repository/chat_repository.dart';

import 'package:payaki/network/model/response/chat/chat_user_list_response.dart';

class ChatListScreenVm extends ChangeNotifier {
  final ChatRepository chatRepository = ChatRepository();

  List<Data>? chatUserList;

  bool chatUserListLoading = true;

  fetchChatUserList({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    chatRepository
        .chatUserList(BasicRequest(
            name: Endpoints.chatEndPoints.chatUserListing, param: Param()))
        .then((value) {
      chatUserListLoading = false;
      chatUserList = value.data;
      notifyListeners();
      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      chatUserListLoading = false;
      logE("Error $error");
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }

  String formatDateTime(String dateTimeString) {
    if (dateTimeString != null && dateTimeString != "") {
      final now = DateTime.now();
      final yesterday = DateTime.now().subtract(Duration(days: 1));

      final dateTime = DateTime.parse(dateTimeString);
      final isToday = dateTime.day == now.day &&
          dateTime.month == now.month &&
          dateTime.year == now.year;
      final isYesterday = dateTime.day == yesterday.day &&
          dateTime.month == yesterday.month &&
          dateTime.year == yesterday.year;

      if (isToday) {
        return 'Today';
      } else if (isYesterday) {
        return 'Yesterday';
      } else {
        return DateFormat("dd-MM-yyyy").format(dateTime);
      }
    } else {
      return "";
    }
  }
}
