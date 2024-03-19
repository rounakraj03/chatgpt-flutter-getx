import 'package:flutter/material.dart';
import 'package:flutter_chatgpt_getx/core/storage.dart';
import 'package:flutter_chatgpt_getx/network/joke_repository.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final AppStorage appStorage = Get.find<AppStorage>();
  final JokeRepository jokeRepository = Get.put(JokeRepository());

  void setLoginStatus(bool status) {
    appStorage.setBool('login', status);
  }

  void getLogInStatus() {
    appStorage.getBool('login');
  }

  void clearAll() {
    appStorage.clearAll();
  }

  Future<String> sendMeJoke() async {
    final joke = await jokeRepository.getJokes();
    Get.bottomSheet(Text(joke));
    return joke;
  }
}
