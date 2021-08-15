import 'package:flutter/material.dart';
import 'package:flutter_chat_app/modules/messages/components/audio_message.dart';

import 'package:flutter_chat_app/modules/messages/components/photo_message.dart';
import 'package:flutter_chat_app/modules/messages/components/text_message.dart';
import 'package:flutter_chat_app/modules/messages/components/video_message.dart';
import 'package:flutter_chat_app/shared/auth/auth_controller.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';

import 'package:flutter_chat_app/shared/models/message_model.dart';
import 'package:flutter_chat_app/shared/models/user_model.dart';
import 'package:flutter_chat_app/theme/theme.dart';

class Message extends StatefulWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);

  final MessageModel message;

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final authController = AuthController();
  late UserModel user;
  bool isSender = false;
  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future getUser() async {
    user = await authController.getUser();
    if (user.email == widget.message.sender!.email) {
      isSender = true;
      setState(() {});
    }
  }

  Widget messageContaint(MessageModel message) {
    switch (message.messageType) {
      case MessageType.audio:
        return AudioMessage(message: message);
      case MessageType.image:
        return PhotoMessage(message: message);
      case MessageType.video:
        return VideoMessage(message: message);
      default:
        return TextMessage(
          message: message,
          isSender: isSender,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);

    return Padding(
      padding: EdgeInsets.only(top: sizes.defaultPaddingValue),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!isSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(widget.message.sender!.avatarUrl!),
            ),
            SizedBox(width: sizes.defaultPaddingValue / 2),
          ],
          messageContaint(widget.message),
        ],
      ),
    );
  }
}
