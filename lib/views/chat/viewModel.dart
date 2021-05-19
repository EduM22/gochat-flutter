import 'dart:async';

import 'package:get/get.dart';
import 'package:gochat/services/chatService.dart';
import 'package:gochat/views/login/login.dart';
import 'package:stacked/stacked.dart';

class ChatViewModel extends BaseViewModel {
  ChatService _service = ChatService();
  List<String> _messages = [];

  void initialise() {
    _service.setupChannel();

    _service.stream.listen((event) {
      print(event);
      this._messages.add(event);
      notifyListeners();
    }, cancelOnError: true).onError((error) {
      print('error: $error');
      Get.offAll(() => LoginView());
    });
  }

  List<String> get messages => this._messages.reversed.toList();
}
