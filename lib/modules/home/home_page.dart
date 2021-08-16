import 'package:flutter/material.dart';
import 'package:flutter_chat_app/modules/chats/chats_page.dart';
import 'package:flutter_chat_app/modules/home/controllers/home_controller.dart';
import 'package:flutter_chat_app/shared/auth/auth_controller.dart';
import 'package:flutter_chat_app/theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ValueListenableBuilder<HomeView>(
        valueListenable: homeController.currentView,
        builder: (context, view, _) {
          switch (view) {
            case HomeView.chats:
              return ChatsPage();
            case HomeView.people:
              return Container(child: Text("people"));
            case HomeView.profile:
              return Container(child: Text("profile"));
          }
        },
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
        homeController.setView(selectedIndex);
        if (index == 2) {
          final authController = AuthController();
          authController.logout().then((value) =>
              Navigator.pushReplacementNamed(context, "/welcome-page"));
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundImage: AssetImage(AppImages.user2),
          ),
          label: "Profile",
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: ValueListenableBuilder<HomeView>(
        valueListenable: homeController.currentView,
        builder: (context, view, _) {
          switch (view) {
            case HomeView.chats:
              return Text("Chats");
            case HomeView.people:
              return Text("People");
            case HomeView.profile:
              return Text("Profile");
          }
        },
      ),
    );
  }
}
