import 'package:get/get.dart';

class ChatController extends GetxController {
  final chatId = ''.obs;
  final userId = ''.obs;
  final newMessage = <String, dynamic>{}.obs;
  final oldMessages = <Map<String, dynamic>>[].obs;
  final chatMessages = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setChatId(String id) {
    chatId.value = id;
  }

  void setUserId(String id) {
    userId.value = id;
  }

  void setNewMessage(Map<String, dynamic> message) {
    newMessage.value = message;
  }

  void addOldMessage(Map<String, dynamic> message) {
    oldMessages.add(message);
  }
}
