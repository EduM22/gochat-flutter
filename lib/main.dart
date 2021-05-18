import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gochat/views/chat/chat.dart';

void main() {
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
      home: ChatView(),
    );
  }
}