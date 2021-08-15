import 'dart:convert';

import 'package:flutter_chat_app/shared/models/user_model.dart';

class MessageModel {
  final String? id;
  final String? text;
  final UserModel? sender;
  final MessageType? messageType;
  final DateTime? sentAt;

  MessageModel({
    this.id,
    this.text,
    this.sender,
    this.messageType,
    this.sentAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'sender': sender?.toMap(),

      // 'messageType': messageType?.toMap(),
      // 'sentAt': sentAt?.toMap(),
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    final message = MessageModel(
      id: map['id'],
      text: map['text'],
      sender: UserModel.fromMap(map['sender']),
      // sentAt: DateTime.tryParse(map['sentAt']) ?? DateTime.now(),
    );
    switch (map["messageType"]) {
      case "video":
        message.copyWith(messageType: MessageType.video);
        break;
      case "audio":
        message.copyWith(messageType: MessageType.audio);
        break;
      case "image":
        message.copyWith(messageType: MessageType.image);
        break;
      default:
        message.copyWith(messageType: MessageType.text);
        break;
    }

    return message;
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));

  MessageModel copyWith({
    String? id,
    String? text,
    UserModel? sender,
    MessageType? messageType,
    DateTime? sentAt,
  }) {
    return MessageModel(
      id: id ?? this.id,
      text: text ?? this.text,
      sender: sender ?? this.sender,
      messageType: messageType ?? this.messageType,
      sentAt: sentAt ?? this.sentAt,
    );
  }

  @override
  String toString() {
    return 'MessageModel(id: $id, text: $text, sender: $sender, messageType: $messageType, sentAt: $sentAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageModel &&
        other.id == id &&
        other.text == text &&
        other.sender == sender &&
        other.messageType == messageType &&
        other.sentAt == sentAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        sender.hashCode ^
        messageType.hashCode ^
        sentAt.hashCode;
  }
}

enum MessageType { text, audio, image, video }
