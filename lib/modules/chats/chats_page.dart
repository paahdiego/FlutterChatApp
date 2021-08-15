import 'package:flutter/material.dart';
import 'package:flutter_chat_app/modules/chats/components/chat_card.dart';
import 'package:flutter_chat_app/modules/chats/controllers/chats_controller.dart';

import 'package:flutter_chat_app/shared/config/app_sizes.dart';

import 'package:flutter_chat_app/theme/theme.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final chatsController = ChatsController();
  @override
  void initState() {
    chatsController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ChatCard(
                  chat: chatsController.chats[index],
                  onPressed: () => Navigator.pushNamed(
                    context,
                    "/chats/messages",
                  ),
                ),
                itemCount: chatsController.chats.length,
              ),
            )
          ],
        ),
        Positioned(
          bottom: sizes.defaultPaddingValue,
          right: sizes.defaultPaddingValue,
          child: FloatingActionButton(
            onPressed: () {
              chatsController.fetch();
            },
            backgroundColor: AppColors.kPrimaryColor,
            child: Icon(
              Icons.person_add_alt_1,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
