import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatgpt_getx/models/chat_message_model.dart';
import 'package:flutter_chatgpt_getx/models/chatgpt_model.dart';

class ChatRepository {
  late Dio dio;
  String baseUrl = "http://35.154.226.55:8080/";

  ChatRepository() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ))
      ..interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
        error: true,
        request: true,
        logPrint: (object) => debugPrint(object.toString()),
      ));
  }

  Stream getChatMessages(
      ChatMessageModelRequest chatMessageModelRequest) async* {
    final response = await dio.post("chatgpt/new-chat",
        data: chatMessageModelRequest.toJson(),
        options: Options(headers: {
          'Accept': 'text/event-stream',
          "Cache-Control": "no-cache",
          "Content-Type": "application/json"
        }, responseType: ResponseType.stream));

    await for (final chunk in response.data.stream) {
      final jsonString = utf8.decode(chunk);
      final chatResponse = NewChatResponse.fromJson(jsonString);
      yield chatResponse;
    }
  }
}
