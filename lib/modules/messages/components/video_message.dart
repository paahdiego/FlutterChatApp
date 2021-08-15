import 'package:flutter/material.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/shared/models/message_model.dart';

import 'package:flutter_chat_app/theme/theme.dart';

class VideoMessage extends StatelessWidget {
  const VideoMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return Container(
      width: sizes.displayWidth * 0.55,
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: sizes.defaultBorderRadius,
              child: Image.asset(AppImages.videoPlaceHere),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_arrow,
                size: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
