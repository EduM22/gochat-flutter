import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:gochat/services/chatService.dart';
import 'package:gochat/views/login/login.dart';
import 'package:stacked/stacked.dart';

class ChatViewModel extends BaseViewModel {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ChatService _service = GetIt.I.get<ChatService>();
  List<String> _messages = [];

  GlobalKey get formKey => _formKey;

  void initialise() {
    _service.stream.listen((event) {
      this._messages.add(event);
      notifyListeners();
    }, cancelOnError: true).onError((error) {
      print('error: $error');
      Get.offAll(() => LoginView());
    });
  }

  List<String> get messages => this._messages.reversed.toList();

  void validateForm() {
    if (this._formKey.currentState!.validate()) {
      print('valid form');
    } else {
      print('not valid');
    }
  }
}
