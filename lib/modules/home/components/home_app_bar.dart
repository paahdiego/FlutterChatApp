import 'package:flutter/material.dart';

import 'package:flutter_chat_app/modules/home/controllers/home_controller.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
    required this.homeController,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  final HomeController homeController;

  @override
  _HomeAppBarState createState() => _HomeAppBarState();

  @override
  final Size preferredSize;
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: ValueListenableBuilder<HomeView>(
        valueListenable: widget.homeController.currentView,
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
