import 'dart:convert';

import 'package:flutter_chat_app/shared/auth/auth_controller.dart';
import 'package:flutter_chat_app/shared/config/connection.dart';
import 'package:flutter_chat_app/modules/chats/models/chat_model.dart';

import 'package:http/http.dart' as http;

class ChatsServices {
  final authController = AuthController();

  Future<List<ChatModel>> list() async {
    final uri = getUri('/chats');

    try {
      print(uri.toString());
      final response = await http.get(
        uri,
        headers: {"Authorization": "Bearer ${await authController.getToken()}"},
      );
      switch (response.statusCode) {
        case 200:
          final json = jsonDecode(response.body);

          final list = (json as List).map(
            (e) {
              return ChatModel.fromMap(e);
            },
          ).toList();

          return list;
        case 401:
          throw 401;
        default:
          throw Exception(response.body);
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
