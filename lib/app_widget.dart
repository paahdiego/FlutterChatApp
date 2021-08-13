import 'package:flutter/material.dart';
import 'package:flutter_chat_app/modules/chats/chats_page.dart';
import 'package:flutter_chat_app/modules/messages/messages_page.dart';
import 'package:flutter_chat_app/modules/signin_or_signup/signin_or_singup_page.dart';
import 'package:flutter_chat_app/modules/welcome/welcome_page.dart';
import 'package:flutter_chat_app/theme/theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeData(context),
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkThemeData(context),
      routes: {
        "/welcome-page": (context) => WelcomePage(),
        "/signin-or-signup": (context) => SignInOrSignUpPage(),
        "/chats": (context) => ChatsPage(),
        "/messages": (context) => MessagesPage(),
      },
      initialRoute: "/welcome-page",
    );
  }
}
