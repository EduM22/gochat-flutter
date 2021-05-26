import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:gochat/services/chatService.dart';
import 'package:gochat/views/login/login.dart';

void main() {
  GetIt.I.registerSingleton<ChatService>(ChatService());
  runApp(GoChat());
}

class GoChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginView(),
    );
  }
}
