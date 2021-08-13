import 'package:flutter/material.dart';
import 'package:flutter_chat_app/modules/messages/components/audio_message.dart';
import 'package:flutter_chat_app/modules/messages/components/message_status_dot.dart';
import 'package:flutter_chat_app/modules/messages/components/photo_message.dart';
import 'package:flutter_chat_app/modules/messages/components/text_message.dart';
import 'package:flutter_chat_app/modules/messages/components/video_message.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/shared/models/chat_message_model.dart';
import 'package:flutter_chat_app/theme/theme.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessageModel message;

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    Widget messageContaint(ChatMessageModel message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
        case ChatMessageType.audio:
          return AudioMessage(message: message);
        case ChatMessageType.image:
          return PhotoMessage(message: message);
        case ChatMessageType.video:
          return VideoMessage(message: message);
      }
    }

    return Padding(
      padding: EdgeInsets.only(top: sizes.defaultPaddingValue),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage(AppImages.user2),
            ),
            SizedBox(width: sizes.defaultPaddingValue / 2),
          ],
          messageContaint(message),
          if (message.isSender)
            MessageStatusDot(
              status: message.messageStatus,
            )
        ],
      ),
    );
  }
}
