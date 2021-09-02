import 'dart:convert';
import 'dart:developer';

import 'package:flutter_chat_app/shared/models/user_model.dart';

class MessageModel {
  final String? id;
  final String? text;
  // final UserModel? sender;
  final String? chatId;

  MessageModel({
    this.id,
    this.text,
    this.chatId,
  });

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'text': text,
      'chatId': chatId,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['_id'],
      text: map['text'],
      chatId: map['chatId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));

  MessageModel copyWith({
    String? id,
    String? text,
    String? chatId,
  }) {
    return MessageModel(
      id: id ?? this.id,
      text: text ?? this.text,
      chatId: chatId ?? this.chatId,
    );
  }

  @override
  String toString() => 'MessageModel(id: $id, text: $text, chatId: $chatId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageModel &&
        other.id == id &&
        other.text == text &&
        other.chatId == chatId;
  }

  @override
  int get hashCode => id.hashCode ^ text.hashCode ^ chatId.hashCode;
}

enum MessageType { text, audio, image, video }
