import 'package:flutter/material.dart';

class HomeController {
  final currentView = ValueNotifier<HomeView>(HomeView.chats);

  void setView(int view) {
    switch (view) {
      case 1:
        currentView.value = HomeView.people;
        break;
      case 2:
        currentView.value = HomeView.profile;
        break;
      default:
        currentView.value = HomeView.chats;
    }
  }
}

enum HomeView {
  chats,
  people,
  profile,
}
