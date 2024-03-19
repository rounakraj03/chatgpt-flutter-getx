import 'package:flutter/material.dart';
import 'package:flutter_chatgpt_getx/presentation/chat/chat_screen.dart';
import 'package:flutter_chatgpt_getx/presentation/onboarding/onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _onboardingController = Get.put(OnboardingController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Onboarding'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Onboarding Screen'),
            ElevatedButton(
              onPressed: () {
                _onboardingController.setLoginStatus(true);
                Get.offAll(const ChatScreen());
              },
              child: const Text('Go to Chat Page ->'),
            ),
          ],
        ));
  }
}
