import 'dart:convert';
import 'dart:developer';

import 'package:flutter_chat_app/modules/messages/models/message_model.dart';
import 'package:flutter_chat_app/shared/auth/auth_controller.dart';
import 'package:flutter_chat_app/shared/config/connection.dart';

import 'package:http/http.dart' as http;

class MessageService {
  final authController = AuthController();

  Future<MessageModel> create({required MessageModel message}) async {
    final uri = getUri('/messages/');
    log(message.toString());

    try {
      print(uri.toString());
      final response = await http.post(
        uri,
        headers: {"Authorization": "Bearer ${await authController.getToken()}"},
        body: message.toMap(),
      );
      switch (response.statusCode) {
        case 201:
          return MessageModel.fromJson(response.body);

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

  Future<List<MessageModel>> list({required String id}) async {
    final uri = getUri('/messages/$id');

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
              return MessageModel.fromMap(e);
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
