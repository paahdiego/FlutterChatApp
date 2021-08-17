import 'package:flutter/material.dart';
import 'package:flutter_chat_app/modules/chats/repositories/chats_repository.dart';
import 'package:flutter_chat_app/shared/models/chat_model.dart';

class ChatsController extends ChangeNotifier {
  final List<ChatModel> chats = [];
  final chatsRepository = ChatsRepository();

  ChatsController() {
    // fetch();
  }

  void fetch() async {
    chats.clear();
    final list = await chatsRepository.list();
    chats.addAll(list);
    notifyListeners();
  }

  void sendMessage() {}
}
