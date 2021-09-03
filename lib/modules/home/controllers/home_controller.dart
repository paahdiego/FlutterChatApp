import 'package:flutter/material.dart';
import 'package:flutter_chat_app/modules/chats/services/chats_service.dart';
import 'package:flutter_chat_app/modules/people/models/person_model.dart';
import 'package:flutter_chat_app/modules/people/services/people_service.dart';
import 'package:flutter_chat_app/shared/auth/auth_controller.dart';
import 'package:flutter_chat_app/modules/chats/models/chat_model.dart';
import 'package:flutter_chat_app/shared/models/user_model.dart';

class HomeController extends ChangeNotifier {
  final currentView = ValueNotifier<HomeView>(HomeView.chats);
  final currentState = ValueNotifier<HomeState>(HomeState.not_loaded);

  final authController = AuthController();
  late UserModel loggedUser;

  int selectedPage = 0;

  HomeController() {
    loadUser();
  }

  final chatsService = ChatsServices();
  final List<ChatModel> chats = [];

  void loadChats() async {
    chats.clear();
    final list = await chatsService.list();
    chats.addAll(list);
    notifyListeners();
  }

  final peopleService = PeopleService();
  final List<PersonModel> people = [];

  Future<void> loadPeople() async {
    people.clear();
    final list = await peopleService.list();
    people.addAll(
      list.where((element) => element.id != loggedUser.id).toList(),
    );
    notifyListeners();
  }

  Future loadUser() async {
    startLoading();
    loggedUser = await authController.getUser();
    stopLoading();
  }

  void setPage(int page) {
    selectedPage = page;
    switch (page) {
      case 1:
        currentView.value = HomeView.people;
        break;
      case 2:
        currentView.value = HomeView.profile;
        break;
      default:
        currentView.value = HomeView.chats;
    }
    notifyListeners();
  }

  void startLoading() {
    currentState.value = HomeState.loading;
    notifyListeners();
  }

  void stopLoading() {
    currentState.value = HomeState.loaded;
    notifyListeners();
  }
}

enum HomeState {
  loading,
  not_loaded,
  loaded,
}

enum HomeView {
  chats,
  people,
  profile,
}
