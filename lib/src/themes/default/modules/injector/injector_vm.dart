import 'package:nukeviet/src/include/base.dart';
import 'package:nukeviet/src/modules/search_query.dart';
import 'package:nukeviet/src/vendor/commons/utils.dart';
import 'package:nukeviet/src/vendor/network/response/mapping/nguoitiemchung.dart';
import 'package:rxdart/rxdart.dart';


class InjectorViewModel extends BaseViewModel {
  final _injectors = BehaviorSubject<InjectorPaging>();

  Stream<InjectorPaging> get injectorsStream => _injectors.stream;

  Function(InjectorPaging) get injectorsChanged => _injectors.sink.add;

  List<NguoiTiemChung> get injectors => _injectors.value.data;

  void getInjectors({SearchQuery param}) {

  }

  @override
  void dispose() {
    super.dispose();

    _injectors.close();
  }
}
