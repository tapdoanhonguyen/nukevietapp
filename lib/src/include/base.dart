import 'package:http/http.dart';
import 'package:nukeviet/src/vendor/network/api/api.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel {
  final BehaviorSubject<BaseResponse> _error = BehaviorSubject();

  Stream<dynamic> get errorStream => _error.stream;

  Function(dynamic) get errorChanged => _error.sink.add;

  final API api = MockAPI.shared;
  // final API api = RemoteAPI.shared;

  void dispose() {
    _error.close();
  }
}