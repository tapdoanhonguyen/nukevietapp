import 'package:nukeviet/src/include/base.dart';
import 'package:nukeviet/src/modules/search_query.dart';
import 'package:nukeviet/src/vendor/commons/utils.dart';
import 'package:nukeviet/src/vendor/network/response/mapping/newsrow.dart';
import 'package:rxdart/rxdart.dart';


class NewListViewModel extends BaseViewModel {
  final _newslist = BehaviorSubject<NewListPaging>();

  Stream<NewListPaging> get newslistStream => _newslist.stream;

  Function(NewListPaging) get newlistChanged => _newslist.sink.add;

  List<NewsRow> get newslist => _newslist.value.data;

  void getNewsList({SearchQuery param}) {
    api
        .getListNewsRow(params: param.toJson())
        .then((value) => newlistChanged(value))
        .catchError((e) {
      logger.info(e.toString());
      newlistChanged(null);
    });
  }

  @override
  void dispose() {
    super.dispose();

    _newslist.close();
  }
}
// TODO Implement this library.