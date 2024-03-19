import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chatgpt_getx/core/storage.dart';
import 'package:flutter_chatgpt_getx/presentation/chat/chat_screen.dart';
import 'package:flutter_chatgpt_getx/presentation/onboarding/onboarding_controller.dart';
import 'package:flutter_chatgpt_getx/presentation/onboarding/onboarding_screen.dart';
import 'package:get/get.dart';

// http://35.154.226.55:8080/chatgpt/new-chat
// {
//    "new_message" : {"role": "user", "content": "hi"},
//   "old_message": [{"role": "user", "content": "hi"}, {"role": "assistant", "content": "hi"}, {"role": "user", "content": "Continue the lyrics...Andekhi Anjaani si pagal se dewani se"}],
//   "userId" : "65dc4685d23b1f44f89babb1",
//   "chatId": null
// }
void main() async {
  await AppStorage.initialize();
  Get.put(AppStorage());
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: FutureBuilder(
        future: Get.find<AppStorage>().getBool('login'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.data == true) {
              return const ChatScreen();
            } else {
              return const OnboardingScreen();
            }
          }
        },
      )
    );
  }
}
