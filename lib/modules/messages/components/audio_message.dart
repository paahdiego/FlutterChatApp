import 'package:flutter/material.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/shared/models/chat_message_model.dart';
import 'package:flutter_chat_app/theme/theme.dart';

class AudioMessage extends StatelessWidget {
  const AudioMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessageModel message;

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return Container(
      width: sizes.displayWidth * 0.55,
      padding: EdgeInsets.symmetric(
        horizontal: sizes.defaultPaddingValue * 0.75,
        vertical: sizes.defaultPaddingValue / 2.5,
      ),
      decoration: BoxDecoration(
        borderRadius: sizes.defaultBorderRadius,
        color: AppColors.kPrimaryColor.withOpacity(message.isSender ? 1 : 0.1),
      ),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            color: message.isSender ? Colors.white : AppColors.kPrimaryColor,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: sizes.defaultPaddingValue / 4,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: AppColors.kPrimaryColor.withOpacity(0.4),
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor,
                          shape: BoxShape.circle),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            "0:37",
            style: TextStyle(
              fontSize: 12,
              color: message.isSender ? Colors.white : null,
            ),
          )
        ],
      ),
    );
  }
}
