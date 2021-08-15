import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_chat_app/shared/models/message_model.dart';
import 'package:flutter_chat_app/shared/models/user_model.dart';

class ChatModel {
  final String? name;
  final String? image;
  final List<UserModel> members = [];
  final List<MessageModel>? messages;
  final MessageModel? lastMessage;
  ChatModel({
    this.name,
    this.messages,
    this.image,
    this.lastMessage,
  });

  ChatModel copyWith({
    String? name,
    List<MessageModel>? messages,
    String? image,
    MessageModel? lastMessage,
  }) {
    return ChatModel(
      name: name ?? this.name,
      messages: messages ?? this.messages,
      image: image ?? this.image,
      lastMessage: lastMessage ?? this.lastMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'messages': messages?.map((x) => x.toMap()).toList(),
      'image': image,
      'lastMessage': lastMessage?.toMap(),
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    print(map);
    return ChatModel(
      name: map['name'],
      messages: List<MessageModel>.from(
          map['messages']?.map((x) => MessageModel.fromMap(x))),
      image: map['image'],
      lastMessage: MessageModel.fromMap(map['lastMessage']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatModel(name: $name, messages: $messages, image: $image, lastMessage: $lastMessage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatModel &&
        other.name == name &&
        listEquals(other.messages, messages) &&
        other.image == image &&
        other.lastMessage == lastMessage;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        messages.hashCode ^
        image.hashCode ^
        lastMessage.hashCode;
  }
}
