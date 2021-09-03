import 'dart:convert';

import 'package:flutter_chat_app/shared/models/user_model.dart';

class MessageModel {
  final String? id;
  final String text;
  final UserModel sender;
  final UserModel receiver;
  final String chat;

  MessageModel({
    this.id,
    required this.text,
    required this.sender,
    required this.receiver,
    required this.chat,
  });

  MessageModel copyWith({
    String? id,
    String? text,
    UserModel? sender,
    UserModel? receiver,
    String? chat,
  }) {
    return MessageModel(
      id: id ?? this.id,
      text: text ?? this.text,
      sender: sender ?? this.sender,
      receiver: receiver ?? this.receiver,
      chat: chat ?? this.chat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'sender': sender.id,
      'receiver': receiver.id,
      'chat': chat,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['_id'],
      text: map['text'],
      sender: UserModel.fromMap(map['sender']),
      receiver: UserModel.fromMap(map['receiver']),
      chat: map['chat'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MessageModel(id: $id, text: $text, sender: $sender, receiver: $receiver, chat: $chat)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageModel &&
        other.id == id &&
        other.text == text &&
        other.sender == sender &&
        other.receiver == receiver &&
        other.chat == chat;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        sender.hashCode ^
        receiver.hashCode ^
        chat.hashCode;
  }
}
