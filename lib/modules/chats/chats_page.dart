import 'package:flutter/material.dart';
import 'package:flutter_chat_app/modules/chats/components/chat_card.dart';

import 'package:flutter_chat_app/modules/home/controllers/home_controller.dart';

import 'package:flutter_chat_app/shared/config/app_sizes.dart';

import 'package:flutter_chat_app/theme/theme.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key, required this.homeController}) : super(key: key);
  final HomeController homeController;

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  void initState() {
    widget.homeController.loadChats();
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
                    chat: widget.homeController.chats[index],
                    onPressed: () {
                      /* Navigator.pushNamed(
                        context,
                        "/home/chats/messages",
                      ); */
                    }),
                itemCount: widget.homeController.chats.length,
              ),
            )
          ],
        ),
        Positioned(
          bottom: sizes.defaultPaddingValue,
          right: sizes.defaultPaddingValue,
          child: FloatingActionButton(
            onPressed: () {},
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
