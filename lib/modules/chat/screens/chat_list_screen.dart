import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/chat/viewModel/chat_list_screen_vm.dart';
import 'package:payaki/modules/transaction/viewModel/transaction_screen_vm.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/circular_progress_widget.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/network_image_widget.dart';
import 'package:provider/provider.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  TransactionScreenVm transactionScreenVm = TransactionScreenVm();

  ChatListScreenVm chatListScreenVm = ChatListScreenVm();

  @override
  void initState() {
    super.initState();

    logD("Chat url :- ${Preference().getUserChatUrl()}");
    chatListScreenVm = Provider.of(context, listen: false);
    chatListScreenVm.fetchChatUserList(onFailure: (message) {
      context.flushBarTopErrorMessage(message: message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorUtility.whiteColor,
        appBar: const CustomAppBar(title: "Chat", isShowBackButton: false),
        body: Consumer<ChatListScreenVm>(
            builder: (context, chatListScreenVm, child) {
          return chatListScreenVm.chatUserListLoading == false
              ? (chatListScreenVm.chatUserList?.length ?? 0) > 0
                  ? ListView.builder(
                      padding: EdgeInsets.only(top: 12.h, bottom: 50.h),
                      itemCount: chatListScreenVm.chatUserList?.length,
                      itemBuilder: (context, index) {
                        String dateTime = chatListScreenVm.formatDateTime(
                            chatListScreenVm
                                    .chatUserList?[index].lastMessageTime ??
                                "");

                        return InkWell(
                          onTap: () {
                            if (chatListScreenVm.chatUserList?[index].chatUrl !=
                                null) {
                              Navigator.pushNamed(
                                  context, RouteName.webViewChatScreen,
                                  arguments: {
                                    "url": chatListScreenVm
                                        .chatUserList?[index].chatUrl,
                                  });
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 20.w,
                                right: 20.w,
                                bottom: 12.5.h,
                                top: 12.5.h),
                            child: Row(
                              children: [
                                ClipOval(
                                    child: NetworkImageWidget(
                                  width: 55.w,
                                  height: 55.w,
                                  url: chatListScreenVm
                                      .chatUserList?[index].image,
                                  alternate: ClipOval(
                                    child: Image.asset(
                                      ImageUtility.userDummyIcon,
                                      width: 55.w,
                                      height: 55.w,
                                    ),
                                  ),
                                )),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            chatListScreenVm
                                                    .chatUserList?[index]
                                                    .username ??
                                                "",
                                            style:
                                                StyleUtility.headingTextStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          dateTime,
                                          style: StyleUtility.axiforma500
                                              .copyWith(
                                                  color:
                                                      ColorUtility.color152D4A,
                                                  fontSize: TextSizeUtility
                                                      .textSize12),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      chatListScreenVm.chatUserList?[index]
                                              .lastMessage ??
                                          "",
                                      style: StyleUtility.axiforma500.copyWith(
                                          color: ColorUtility.color152D4A,
                                          fontSize: TextSizeUtility.textSize14),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ),
                        );
                      })
                  : Center(
                      child: Text(
                        "No User Found",
                        style: StyleUtility.inputTextStyle,
                      ),
                    )
              : const CircularProgressWidget();
        }));
  }
}
