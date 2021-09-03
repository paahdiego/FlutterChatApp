import 'dart:convert';

class PersonModel {
  final String? id;
  final String? name;
  final String? email;
  final String? avatarUrl;
  final String? phone;
  PersonModel({
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

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      id: map['_id'],
      name: map['name'],
      email: map['email'],
      avatarUrl: map['avatarUrl'],
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonModel.fromJson(String source) =>
      PersonModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PersonModel(id: $id, name: $name, email: $email, avatarUrl: $avatarUrl, phone: $phone)';
  }
}
