import 'dart:convert';

class ChatgptModel {
  final String role;
  final String content;

  ChatgptModel({required this.role, required this.content});

  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'content': content,
    };
  }

  factory ChatgptModel.fromMap(Map<String, dynamic> map) {
    return ChatgptModel(
      role: map['role'] ?? '',
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatgptModel.fromJson(String source) =>
      ChatgptModel.fromMap(json.decode(source));
}
