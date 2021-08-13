import 'package:flutter/material.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/shared/models/chat_message_model.dart';
import 'package:flutter_chat_app/theme/theme.dart';

class PhotoMessage extends StatelessWidget {
  const PhotoMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessageModel message;

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return Container(
      width: sizes.displayWidth * 0.55,
      child: AspectRatio(
        aspectRatio: 1.6,
        child: ClipRRect(
          borderRadius: sizes.defaultBorderRadius,
          child: Image.asset(AppImages.videoPlaceHere),
        ),
      ),
    );
  }
}
