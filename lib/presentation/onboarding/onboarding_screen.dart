import 'package:flutter/material.dart';
import 'package:flutter_chatgpt_getx/presentation/chat/chat_screen.dart';
import 'package:flutter_chatgpt_getx/presentation/onboarding/onboarding_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _onboardingController = Get.put(OnboardingController());
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          centerTitle: true,
          backgroundColor: Color(0xFF2E3B62),
          title: const Text(
            'Onboarding',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Onboarding Screen'),
            ElevatedButton(
              onPressed: () {
                _onboardingController.setLoginStatus(true);
                Get.offAll(const ChatScreen());
              },
              child: const Text('Go to Chat Page ->'),
            ),
            ElevatedButton(
                onPressed: () {
                  _onboardingController.sendMeJoke();
                },
                child: Text("Show a Joke"))
          ],
        ));
  }
}
