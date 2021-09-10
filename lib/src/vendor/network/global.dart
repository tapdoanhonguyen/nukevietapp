
import 'package:crypt/crypt.dart';
import 'package:nukeviet/src/modules/server_info.dart';
import 'package:rxdart/rxdart.dart';
import 'response/mapping/user.dart';
class Global {
  static String _schema = 'https';
  static String _baseUrl = r'hcm.nukeviet.vn/api.php';

  Global() {
    setServer(_serverInfo);
  }

  static final shared = Global();

  String get authority => _baseUrl;

  ServerInfo _serverInfo = ServerInfo.nukeviet;
  ServerInfo get server => _serverInfo;

  setServer(ServerInfo info) {
    _serverInfo = info;
    _baseUrl = info.baseUrl;
    _schema = info.protocol;
  }
  setDataPost( String module, String action){
    final  hashsecret = Crypt.sha512(server.apisec + '_' + timestamp.toString());

    //Global.shared.datapost = jsonEncode({'apikey' : server.apikey});
    Global.shared.datapost = {
      'apikey' : server.apikey,
      'timestamp' :  timestamp.toString(),
      'hashsecret' :  hashsecret.toString(),
      'lang' : Global.shared.lang,
      'module' : module,
      'action' : action
    };
  }
  String endpoint(String path) {
    return _schema + '://' + _baseUrl + (path.startsWith('') ? path : ('/$path'));
  }

  String deviceToken = '';
  String passDefault = '';
  String lang = 'vi';
  int timestamp = DateTime.now().microsecondsSinceEpoch+20000;
  Map<String,dynamic> datapost ;

  final appUser = BehaviorSubject<User>();
  User get currentUser => appUser.value;
  void saveUser(User user) => appUser.sink.add(user);

  void dispose() {
    appUser.close();
  }
}