import 'package:flutter/material.dart';

import 'package:flutter_chat_app/modules/chats/controllers/chats_controller.dart';
import 'package:flutter_chat_app/modules/messages/components/chat_input_field.dart';
import 'package:flutter_chat_app/modules/messages/components/message.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/shared/models/chat_model.dart';

class MessagesBody extends StatelessWidget {
  const MessagesBody({
    Key? key,
    required this.chat,
    // required this.controller,
  }) : super(key: key);
  final ChatModel chat;
  // final ChatsController controller;

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: sizes.defaultPaddingValue),
            child: ListView.builder(
              itemCount: chat.messages!.length,
              itemBuilder: (context, index) => Message(
                message: chat.messages![index],
              ),
            ),
          ),
        ),
        ChatInputField(
          onSubmitted: (message) {
            // controller.chatsRepository.sendMessage(message, chat);
          },
        ),
      ],
    );
  }
}
