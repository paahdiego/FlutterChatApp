import 'package:flutter/material.dart';

import 'package:flutter_chat_app/modules/messages/components/chat_input_field.dart';
import 'package:flutter_chat_app/modules/messages/components/message.dart';
import 'package:flutter_chat_app/modules/messages/controllers/messages_controller.dart';
import 'package:flutter_chat_app/modules/messages/models/message_model.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';

class MessagesBody extends StatefulWidget {
  const MessagesBody({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MessageController controller;

  @override
  _MessagesBodyState createState() => _MessagesBodyState();
}

class _MessagesBodyState extends State<MessagesBody> {
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
              itemCount: widget.controller.messages.length,
              itemBuilder: (context, index) => Message(
                message: widget.controller.messages[index],
                sender: widget.controller.sender,
              ),
            ),
          ),
        ),
        ChatInputField(
          onSubmitted: (message) {
            final newMessage = MessageModel(
              text: message,
              sender: widget.controller.sender,
              receiver: widget.controller.receiver,
              chat: widget.controller.chat.id!,
            );

            widget.controller.createMessage(message: newMessage);
          },
        ),
      ],
    );
  }
}
