import 'package:flutter/material.dart';

import 'package:flutter_chat_app/modules/messages/components/body.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/modules/chats/models/chat_model.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({
    Key? key,
    required this.chat,
  }) : super(key: key);
  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return Scaffold(
      appBar: buildAppBar(sizes),
      body: MessagesBody(
        chat: chat,
      ),
    );
  }

  AppBar buildAppBar(AppSizes sizes) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          CircleAvatar(
            backgroundImage: NetworkImage(chat.image!),
          ),
          SizedBox(width: sizes.defaultPaddingValue * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chat.name ?? "name",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
