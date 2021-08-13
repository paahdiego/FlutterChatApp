import 'package:flutter/material.dart';
import 'package:flutter_chat_app/modules/messages/components/body.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/theme/theme.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return Scaffold(
      appBar: buildAppBar(sizes),
      body: MessagesBody(),
    );
  }

  AppBar buildAppBar(AppSizes sizes) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage(AppImages.user2),
          ),
          SizedBox(width: sizes.defaultPaddingValue * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kristin Watson",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "active 3m ago",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.local_phone)),
        IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
        SizedBox(
          width: sizes.defaultPaddingValue * 0.5,
        ),
      ],
    );
  }
}
