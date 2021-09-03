import 'package:flutter/material.dart';
import 'package:flutter_chat_app/modules/messages/components/text_message.dart';

import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/modules/messages/models/message_model.dart';
import 'package:flutter_chat_app/shared/models/user_model.dart';

class Message extends StatefulWidget {
  const Message({
    Key? key,
    required this.message,
    required this.sender,
  }) : super(key: key);

  final MessageModel message;
  final UserModel sender;

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);

    return Padding(
      padding: EdgeInsets.only(top: sizes.defaultPaddingValue),
      child: Row(
        mainAxisAlignment: widget.sender.id == widget.message.sender.id
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.sender.id != widget.message.sender.id) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(widget.message.sender.avatarUrl!),
            ),
            SizedBox(width: sizes.defaultPaddingValue / 2),
          ],
          TextMessage(
            message: widget.message,
            isSender: widget.sender.id == widget.message.sender.id,
          ),
        ],
      ),
    );
  }
}
