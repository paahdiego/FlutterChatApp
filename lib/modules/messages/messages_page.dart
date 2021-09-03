import 'package:flutter/material.dart';

import 'package:flutter_chat_app/modules/messages/components/body.dart';
import 'package:flutter_chat_app/modules/messages/controllers/messages_controller.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/modules/chats/models/chat_model.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({
    Key? key,
    required this.chat,
  }) : super(key: key);
  final ChatModel chat;

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  late MessageController messageController;

  @override
  void initState() {
    messageController = MessageController(widget.chat);
    messageController.addListener(() {
      setState(() {});
    });
    messageController.definePeopleInChat();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);

    return Scaffold(
      appBar: buildAppBar(sizes),
      body: ValueListenableBuilder<MessagePageState>(
        valueListenable: messageController.messageStateNotifier,
        builder: (context, state, _) {
          switch (state) {
            case MessagePageState.loaded:
              return MessagesBody(
                controller: messageController,
              );
            case MessagePageState.not_loaded:
              return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  AppBar buildAppBar(AppSizes sizes) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          if (messageController.state == MessagePageState.loaded)
            CircleAvatar(
              backgroundImage:
                  NetworkImage(messageController.receiver.avatarUrl!),
            ),
          SizedBox(width: sizes.defaultPaddingValue * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (messageController.state == MessagePageState.loaded)
                Text(
                  messageController.receiver.name!,
                  style: TextStyle(fontSize: 15),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
