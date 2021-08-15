import 'package:flutter/material.dart';

import 'package:flutter_chat_app/modules/home/home_page.dart';
import 'package:flutter_chat_app/modules/login/login.dart';
import 'package:flutter_chat_app/modules/messages/messages_page.dart';
import 'package:flutter_chat_app/modules/welcome/welcome_page.dart';
import 'package:flutter_chat_app/shared/models/chat_model.dart';
import 'package:flutter_chat_app/theme/theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeData(context),
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkThemeData(context),
      routes: {
        "/welcome-page": (context) => WelcomePage(),
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/chats/messages": (context) => MessagesPage(
              chat: (ModalRoute.of(context)!.settings.arguments as ChatModel),
            ),
      },
      initialRoute: "/welcome-page",
    );
  }
}
