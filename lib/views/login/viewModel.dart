import 'package:get/get.dart';
import 'package:gochat/views/chat/chat.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey get formKey => _formKey;

  void initialise() {}

  void validateForm() {
    if (this._formKey.currentState!.validate()) {
      print('valid form');
      Get.offAll(() => ChatView());
    } else {
      print('not valid');
    }
  }
}
