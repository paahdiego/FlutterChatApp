import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_chat_app/modules/chats/models/chat_model.dart';
import 'package:flutter_chat_app/modules/home/controllers/home_controller.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.chat,
    required this.onPressed,
    required this.homeController,
  }) : super(key: key);
  final ChatModel chat;
  final VoidCallback onPressed;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    log(chat.toString());
    int sender = 1;
    if (homeController.loggedUser.id == chat.members[1].id) sender = 0;

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
              backgroundImage: NetworkImage(chat.members[sender].avatarUrl!),
            ),
            SizedBox(width: sizes.defaultPaddingValue),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.members[sender].name!,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Opacity(
                    opacity: 0.64,
                    child: Text(
                      chat.lastMessage!.text,
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
