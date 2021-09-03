import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_chat_app/modules/messages/models/message_model.dart';
import 'package:flutter_chat_app/shared/models/user_model.dart';

class ChatModel {
  final String? id;
  final String? name;
  final String? image;
  final List<UserModel> members;
  final MessageModel? lastMessage;

  ChatModel({
    this.id,
    this.name,
    this.image,
    required this.members,
    this.lastMessage,
  });

  ChatModel copyWith({
    String? id,
    String? name,
    String? image,
    List<UserModel>? members,
    MessageModel? lastMessage,
  }) {
    return ChatModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      members: members ?? this.members,
      lastMessage: lastMessage ?? this.lastMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'image': image,
      'members': members.map((x) => x.toMap()).toList(),
      'lastMessage': lastMessage?.toMap(),
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['_id'],
      name: map['name'],
      image: map['image'],
      members: List<UserModel>.from(
          map['members']?.map((x) => UserModel.fromMap(x))),
      lastMessage: MessageModel.fromMap(map['lastMessage']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatModel(id: $id, name: $name, image: $image, members: $members, lastMessage: $lastMessage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatModel &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        listEquals(other.members, members) &&
        other.lastMessage == lastMessage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        members.hashCode ^
        lastMessage.hashCode;
  }
}
