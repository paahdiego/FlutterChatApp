import 'package:flutter/material.dart';

import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/modules/messages/models/message_model.dart';
import 'package:flutter_chat_app/theme/theme.dart';

class TextMessage extends StatefulWidget {
  const TextMessage({
    Key? key,
    required this.message,
    required this.isSender,
  }) : super(key: key);

  final MessageModel message;
  final bool isSender;

  @override
  _TextMessageState createState() => _TextMessageState();
}

class _TextMessageState extends State<TextMessage> {
  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return Container(
      constraints: BoxConstraints(
        maxWidth: widget.isSender
            ? sizes.defaultWidgetWidth
            : sizes.defaultWidgetWidth - 33,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: sizes.defaultPaddingValue * 0.75,
        vertical: sizes.defaultPaddingValue / 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor.withOpacity(widget.isSender ? 1 : 0.1),
        borderRadius: sizes.defaultBorderRadius,
      ),
      child: Text(
        widget.message.text,
        style: TextStyle(
          color: widget.isSender
              ? Colors.white
              : Theme.of(context).textTheme.bodyText1!.color,
        ),
      ),
    );
  }
}
