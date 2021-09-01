import 'package:rxdart/rxdart.dart';

import 'response/mapping/user.dart';

class Global {
  static String _schema = 'https://';
  static String _baseUrl = r'nukeviet.vn/api.php';

  Global._();

  static final shared = Global._();

  String get authority => _baseUrl;

  setBaseUrl(String url) {
    _baseUrl = url;
  }

  String endpoint(String path) {
    return _schema + _baseUrl + (path.startsWith('/') ? path : ('/$path'));
  }

  String deviceToken = '';

  final appUser = BehaviorSubject<User>();
  User get currentUser => appUser.value;
  void saveUser(User user) => appUser.sink.add(user);

  void dispose() {
    appUser.close();
  }
}