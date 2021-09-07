import 'package:nukeviet/src/include/base.dart';
import 'package:nukeviet/src/modules/dashboard.dart';
import 'package:nukeviet/src/modules/summary.dart';
import 'package:nukeviet/src/vendor/network/api/api.dart';

class MainViewModel extends BaseViewModel {
  Future<Summary> getSummary() async {
    try {
      var res = await NVNetwork.getData(
        uri: 'https://tiemchungcovid19.gov.vn/api/public/dashboard/vaccination-statistics/summary',
      );
      return Summary.fromJson(res);
    } catch (e) {
      throw e;
    }
  }

  Future<Dashboard> getDashboard() async {
    try {
      var res = await NVNetwork.getData(
        uri: 'https://tiemchungcovid19.gov.vn/api/public/dashboard/vaccination-statistics/get-detail-latest',
      );
      return Dashboard.fromJson(res);
    } catch (e) {
      throw e;
    }
  }
}