import 'dart:convert';

import 'package:flutter_chatgpt_getx/core/storage.dart';
import 'package:flutter_chatgpt_getx/models/chat_message_model.dart';
import 'package:flutter_chatgpt_getx/models/chatgpt_model.dart';
import 'package:flutter_chatgpt_getx/network/chat_repository.dart';
import 'package:flutter_chatgpt_getx/presentation/onboarding/onboarding_screen.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final ChatRepository chatRepository = Get.put(ChatRepository());
  final AppStorage appStorage = Get.find();

  RxString chatId = ''.obs;
  RxString userId = '65dc4685d23b1f44f89babb1'.obs;
  Rx<ChatgptModel> newMessage = ChatgptModel(role: "user", content: "hi").obs;
  RxList<ChatgptModel> chatMessages = <ChatgptModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  fetchData() async {
    final response = await chatRepository
        .getChatMessages(
      ChatMessageModelRequest(
        old_message: chatMessages.toList(),
        new_message: chatMessages.last,
        userId: userId.value,
        chatId: chatId.value,
      ),
    )
        .listen((event) {
      print("Event => $event");

      setChatId(event.chatId);
      if (chatMessages.last.role == "user") {
        chatMessages.add(ChatgptModel(role: "assistant", content: event.data));
      } else {
        chatMessages.last = ChatgptModel(
          role: "assistant",
          content: chatMessages.last.content + event.data,
        );
      }
    });
  }

  void setChatId(String id) {
    chatId.value = id;
  }

  void setUserId(String id) {
    userId.value = id;
  }

  void enterButtonFunction(String message) {
    newMessage.value = ChatgptModel(role: "user", content: message);
    chatMessages.add(newMessage.value);
    fetchData();
  }

  void newChat() {
    setChatId('');
    chatMessages.clear();
  }

  void logout() {
    appStorage.setBool('login', false);
    appStorage.clearAll();
    Get.offAll(() => const OnboardingScreen());
  }
}
