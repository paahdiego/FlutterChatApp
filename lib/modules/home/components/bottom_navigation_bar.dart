import 'package:flutter/material.dart';

import 'package:flutter_chat_app/modules/home/controllers/home_controller.dart';

class HomePageBottomNavigationBar extends StatefulWidget {
  const HomePageBottomNavigationBar({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  _HomePageBottomNavigationBarState createState() =>
      _HomePageBottomNavigationBarState();
}

class _HomePageBottomNavigationBarState
    extends State<HomePageBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.homeController.selectedPage,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        widget.homeController.setPage(index);
        setState(() {});
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
        BottomNavigationBarItem(
          icon: ValueListenableBuilder<HomeState>(
              valueListenable: widget.homeController.currentState,
              builder: (context, state, _) {
                switch (state) {
                  case HomeState.loaded:
                    return Container(
                      width: 24,
                      height: 24,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            widget.homeController.loggedUser.avatarUrl!),
                      ),
                    );
                  default:
                    return Icon(Icons.person);
                }
              }),
          label: "Profile",
        ),
      ],
    );
  }
}
