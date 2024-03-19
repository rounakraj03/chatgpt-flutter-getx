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
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    Text(chatController.chatMessages[index].values.first),
                separatorBuilder: (context, index) => const SizedBox(height: 5),
                itemCount: chatController.chatMessages.length),
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
                  if(messageController.text.isNotEmpty) {
                    chatController.setNewMessage({
                      'role': 'user',
                      'content': messageController.text
                    });
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
