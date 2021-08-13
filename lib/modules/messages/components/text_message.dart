import 'package:flutter/material.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/shared/models/chat_message_model.dart';
import 'package:flutter_chat_app/theme/theme.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessageModel message;

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: sizes.defaultPaddingValue * 0.75,
        vertical: sizes.defaultPaddingValue / 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor.withOpacity(message.isSender ? 1 : 0.1),
        borderRadius: sizes.defaultBorderRadius,
      ),
      child: Text(
        message.text,
        style: TextStyle(
          color: message.isSender
              ? Colors.white
              : Theme.of(context).textTheme.bodyText1!.color,
        ),
      ),
    );
  }
}
