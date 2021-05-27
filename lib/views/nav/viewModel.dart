import 'package:get_it/get_it.dart';
import 'package:gochat/services/chatService.dart';
import 'package:stacked/stacked.dart';

class NavViewModel extends IndexTrackingViewModel {
  ChatService _service = GetIt.I.get<ChatService>();

  void init() {
    _service.setupChannel();
    _service.stream.listen((event) {
      _service.add(event);
      print("msg: $event");
    });
  }
}
