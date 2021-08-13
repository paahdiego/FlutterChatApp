import 'package:flutter/material.dart';
import 'package:flutter_chat_app/modules/messages/components/chat_input_field.dart';
import 'package:flutter_chat_app/modules/messages/components/message.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/shared/models/chat_message_model.dart';

class MessagesBody extends StatelessWidget {
  const MessagesBody({Key? key}) : super(key: key);

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
              itemCount: ChatMessageModel.demoChatMessages.length,
              itemBuilder: (context, index) => Message(
                message: ChatMessageModel.demoChatMessages[index],
              ),
            ),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}
