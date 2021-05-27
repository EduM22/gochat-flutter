import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/html.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatService {
  late WebSocketChannel _channel;
  StreamController _streamController = StreamController<dynamic>.broadcast();
  List<String> _messages = [];

  void setupChannel({String? url}) {
    if (kIsWeb) {
      this._channel = HtmlWebSocketChannel.connect(
          Uri.parse(url ?? 'ws://localhost:8080/ws'));
    } else {
      this._channel = IOWebSocketChannel.connect(
          Uri.parse(url ?? 'ws://localhost:8080/ws'));
    }
    _streamController.addStream(this._channel.stream);
  }

  List<String> get messages => this._messages;
  Stream get stream => this._streamController.stream;

  void add(String msg) {
    this._messages.add(msg);
  }

  void send(String msg) {
    this._channel.sink.add(msg);
  }

  void close() {
    this._channel.sink.close();
  }
}
