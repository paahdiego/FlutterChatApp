import 'package:flutter/material.dart';
import 'package:flutter_chat_app/modules/chats/models/chat_model.dart';
import 'package:flutter_chat_app/modules/messages/services/message_service.dart';

import 'package:flutter_chat_app/shared/auth/auth_controller.dart';
import 'package:flutter_chat_app/modules/messages/models/message_model.dart';
import 'package:flutter_chat_app/shared/models/user_model.dart';

class MessageController extends ChangeNotifier {
  final messageStateNotifier =
      ValueNotifier<MessagePageState>(MessagePageState.not_loaded);

  MessagePageState get state => messageStateNotifier.value;

  final ChatModel chat;

  late UserModel receiver;
  late UserModel sender;

  final authController = AuthController();

  MessageController(this.chat);

  Future definePeopleInChat() async {
    final user = await authController.getUser();
    this.sender = UserModel.fromJson(user.toJson());

    this.receiver =
        this.chat.members.firstWhere((element) => element.id != sender.id);

    await this.getMessages();
    messageStateNotifier.value = MessagePageState.loaded;
    notifyListeners();
  }

  final List<MessageModel> messages = [];
  final messageService = MessageService();

  Future getMessages() async {
    final newMessages = await messageService.list(id: this.chat.id!);
    final List<MessageModel> reallyNewMessages = [];

    for (final message in newMessages) {
      if (!checkIfMessageAlreadyExists(message)) this.messages.add(message);
    }

    messages.addAll(reallyNewMessages);
    print(messages.length);
    notifyListeners();
    Future.delayed(Duration(seconds: 10)).then((value) => this.getMessages());
  }

  Future createMessage({required MessageModel message}) async {
    final response = await messageService.create(message: message);
    notifyListeners();
  }

  bool checkIfMessageAlreadyExists(MessageModel newMessage) {
    final find =
        this.messages.indexWhere((element) => element.id == newMessage.id);

    if (find == -1) return false;
    return true;
  }
}

enum MessagePageState {
  loaded,
  not_loaded,
}
