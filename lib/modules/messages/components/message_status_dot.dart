import 'package:flutter/material.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/shared/models/chat_message_model.dart';
import 'package:flutter_chat_app/theme/theme.dart';

class MessageStatusDot extends StatelessWidget {
  const MessageStatusDot({
    Key? key,
    required this.status,
  }) : super(key: key);
  final MessageStatus status;
  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return AppColors.kErrorColor;
        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.1);
        case MessageStatus.viewed:
          return AppColors.kPrimaryColor;
      }
    }

    return Container(
      margin: EdgeInsets.only(left: sizes.defaultPaddingValue / 2),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(status),
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.not_sent ? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
