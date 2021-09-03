import 'dart:convert';
import 'dart:developer';

class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? avatarUrl;
  final String? phone;
  UserModel({
    this.id,
    this.name,
    this.email,
    this.avatarUrl,
    this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'],
      name: map['name'],
      email: map['email'],
      avatarUrl: map['avatarUrl'],
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, avatarUrl: $avatarUrl, phone: $phone)';
  }
}
