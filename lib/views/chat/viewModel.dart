import 'package:gochat/services/chatService.dart';
import 'package:stacked/stacked.dart';

class ChatViewModel extends BaseViewModel {
  String title = 'default';

  ChatService _service = ChatService();
  List<String> _messages = [];

  void initialise() {
    _service.setupChannel();

    _service.stream.listen((event) {
      print(event);
      this._messages.add(event);
      notifyListeners();
    });
  }

  List<String> get messages => this._messages.reversed.toList();
}
