import 'package:flutter/material.dart';

import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/theme/theme.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key? key,
    this.onSubmitted,
  }) : super(key: key);

  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: sizes.defaultPaddingValue,
        vertical: sizes.defaultPaddingValue * 0.5,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                padding: EdgeInsets.symmetric(
                  horizontal: sizes.defaultPaddingValue * 0.75,
                ),
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor.withOpacity(0.08),
                  borderRadius: sizes.defaultBorderRadius,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 32,
                      color: Color(0xFF087949).withOpacity(0.08),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Type message",
                    border: InputBorder.none,
                  ),
                  onSubmitted: onSubmitted,
                  textInputAction: TextInputAction.done,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
