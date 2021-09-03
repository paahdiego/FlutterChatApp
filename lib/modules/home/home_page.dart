import 'package:flutter/material.dart';
import 'package:flutter_chat_app/modules/chats/chats_page.dart';
import 'package:flutter_chat_app/modules/home/components/bottom_navigation_bar.dart';
import 'package:flutter_chat_app/modules/home/components/home_app_bar.dart';
import 'package:flutter_chat_app/modules/home/controllers/home_controller.dart';
import 'package:flutter_chat_app/modules/people/people_page.dart';
import 'package:flutter_chat_app/modules/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  @override
  void initState() {
    homeController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(homeController: homeController),
      body: ValueListenableBuilder<HomeState>(
        valueListenable: homeController.currentState,
        builder: (context, state, child) {
          switch (state) {
            case HomeState.loading:
              return Center(
                child: CircularProgressIndicator(),
              );
            case HomeState.loaded:
              return ValueListenableBuilder<HomeView>(
                valueListenable: homeController.currentView,
                builder: (context, view, _) {
                  switch (view) {
                    case HomeView.chats:
                      return ChatsPage(homeController: homeController);
                    case HomeView.people:
                      return PeoplePage(homeController: homeController);
                    case HomeView.profile:
                      return ProfilePage(homeController: homeController);
                  }
                },
              );

            case HomeState.not_loaded:
              return Container();
          }
        },
      ),
      bottomNavigationBar: HomePageBottomNavigationBar(
        homeController: homeController,
      ),
    );
  }
}
