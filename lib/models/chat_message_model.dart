import 'dart:convert';

import 'package:flutter_chatgpt_getx/models/chatgpt_model.dart';

class ChatMessageModelRequest {
  final List<ChatgptModel> old_message;
  final ChatgptModel new_message;
  final String userId;
  final String? chatId;

  ChatMessageModelRequest(
      {required this.old_message,
      required this.new_message,
      required this.userId,
      this.chatId});

  Map<String, dynamic> toMap() {
    return {
      'old_message': old_message.map((x) => x.toMap()).toList(),
      'new_message': new_message.toMap(),
      'userId': userId,
      'chatId': chatId,
    };
  }

  factory ChatMessageModelRequest.fromMap(Map<String, dynamic> map) {
    return ChatMessageModelRequest(
      old_message: List<ChatgptModel>.from(
          map['old_message']?.map((x) => ChatgptModel.fromMap(x))),
      new_message: ChatgptModel.fromMap(map['new_message']),
      userId: map['userId'] ?? '',
      chatId: map['chatId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessageModelRequest.fromJson(String source) =>
      ChatMessageModelRequest.fromMap(json.decode(source));
}

class NewChatResponse {
  String data;
  String chatId;
  NewChatResponse({
    required this.data,
    required this.chatId,
  });

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'chatId': chatId,
    };
  }

  factory NewChatResponse.fromMap(Map<String, dynamic> map) {
    return NewChatResponse(
      data: map['data'] ?? '',
      chatId: map['chatId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NewChatResponse.fromJson(String source) =>
      NewChatResponse.fromMap(json.decode(source));
}
