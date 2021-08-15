import 'package:flutter/material.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/shared/models/chat_model.dart';
import 'package:flutter_chat_app/theme/theme.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.chat,
    required this.onPressed,
  }) : super(key: key);
  final ChatModel chat;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: sizes.defaultPaddingValue,
          vertical: sizes.defaultPaddingValue * 0.75,
        ),
        child: Row(
          children: [
            chat.image != null
                ? CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(chat.image!),
                  )
                : CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.kPrimaryColor,
                    //backgroundImage: AssetImage(chat.image),
                  ),
            SizedBox(width: sizes.defaultPaddingValue),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.name!,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Opacity(
                    opacity: 0.64,
                    child: Text(
                      chat.lastMessage!.text!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Opacity(
              opacity: 0.64,
              child: Text("1m ago"),
            ),
          ],
        ),
      ),
    );
  }
}
