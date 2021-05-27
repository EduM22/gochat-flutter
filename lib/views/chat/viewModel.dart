import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gochat/services/chatService.dart';
import 'package:stacked/stacked.dart';

class ChatViewModel extends BaseViewModel {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ChatService _service = GetIt.I.get<ChatService>();
  TextEditingController _messageController = TextEditingController();

  GlobalKey get formKey => _formKey;
  TextEditingController get messageController => _messageController;

  void init() {
    _service.stream.listen((event) {
      notifyListeners();
    });
  }

  List<String> get messages => this._service.messages;

  void validateForm() {
    if (this._formKey.currentState!.validate()) {
      this._service.send(this._messageController.text);
      this._messageController.clear();
    } else {
      print('not valid');
    }
  }
}
