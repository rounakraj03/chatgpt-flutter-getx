import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chatgpt_getx/presentation/chat/chat_controller.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatController chatController;
  late TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    chatController = Get.put(ChatController());
    messageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        leading: IconButton(
          icon: const Icon(Icons.power_settings_new_outlined),
          onPressed: () {
            chatController.logout();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.changeThemeMode(
                    Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
              },
              icon: Get.isDarkMode
                  ? const Icon(Icons.sunny)
                  : const Icon(Icons.dark_mode_outlined)),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              chatController.newChat();
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Obx(
              () => ListView.separated(
                  itemBuilder: (context, index) =>
                      Text(chatController.chatMessages[index].content),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 5),
                  itemCount: chatController.chatMessages.length),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: const InputDecoration(
                    hintText: 'Type a message...',
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  if (messageController.text.isNotEmpty) {
                    chatController.enterButtonFunction(messageController.text);
                    messageController.clear();
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
