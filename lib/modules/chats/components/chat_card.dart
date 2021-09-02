import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/modules/chats/models/chat_model.dart';

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
    log(chat.toString());
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: sizes.defaultPaddingValue,
          vertical: sizes.defaultPaddingValue * 0.75,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(chat.members[1].avatarUrl!),
            ),
            SizedBox(width: sizes.defaultPaddingValue),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.members[1].name!,
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
