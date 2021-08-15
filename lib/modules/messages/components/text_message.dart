import 'package:flutter/material.dart';

import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/shared/models/message_model.dart';
import 'package:flutter_chat_app/theme/theme.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
    required this.isSender,
  }) : super(key: key);

  final MessageModel message;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: sizes.defaultPaddingValue * 0.75,
        vertical: sizes.defaultPaddingValue / 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor.withOpacity(isSender ? 1 : 0.1),
        borderRadius: sizes.defaultBorderRadius,
      ),
      child: Text(
        message.text!,
        style: TextStyle(
          color: isSender
              ? Colors.white
              : Theme.of(context).textTheme.bodyText1!.color,
        ),
      ),
    );
  }
}
