import 'package:flutter/material.dart';
import 'package:flutter_chat_app/modules/chats/components/chat_card.dart';
import 'package:flutter_chat_app/shared/components/filled_outline_button.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/shared/models/chat_model.dart';
import 'package:flutter_chat_app/theme/app_colors.dart';

class ChatsBody extends StatelessWidget {
  const ChatsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: sizes.defaultPaddingValue,
            right: sizes.defaultPaddingValue,
            bottom: sizes.defaultPaddingValue,
          ),
          color: AppColors.kPrimaryColor,
          child: Row(
            children: [
              FillOutlineButton(
                press: () {},
                text: "Recent Message",
              ),
              SizedBox(width: sizes.defaultPaddingValue),
              FillOutlineButton(
                press: () {},
                text: "Active",
                isFilled: false,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => ChatCard(
              chat: ChatModel.chatsData[index],
              onPressed: () => Navigator.pushNamed(context, "/messages"),
            ),
            itemCount: ChatModel.chatsData.length,
          ),
        )
      ],
    );
  }
}
