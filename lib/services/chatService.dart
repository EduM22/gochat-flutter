import 'package:web_socket_channel/io.dart';

class ChatService {
  late IOWebSocketChannel _channel;

  void setupChannel({String? url}) {
    this._channel =
        IOWebSocketChannel.connect(Uri.parse(url ?? 'ws://localhost:8080/ws'));
  }

  Stream get stream => this._channel.stream;

  void send(String msg) {
    this._channel.sink.add(msg);
  }

  void close() {
    this._channel.sink.close();
  }
}
