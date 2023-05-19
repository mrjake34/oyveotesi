import 'package:dio/dio.dart';
import 'package:oyveotesi/constants/network/constants_network.dart';
import 'package:oyveotesi/screens/reports_page/model/ballot_box_list_model.dart';
import 'package:oyveotesi/screens/reports_page/service/reports_service_interface.dart';

class ReportsService extends IReportsService {
  Dio dio = Dio();

  @override
  Future<BallotBoxList?> getBallotBoxList() async {
    final response = await dio.get(ballotBoxListPath,
        options: Options(headers: {"Authorization": token}));
    if (response.statusCode == 200) {
      BallotBoxList ballotBoxList = BallotBoxList.fromJson(response.data);
      return ballotBoxList;
    } else if (response.statusCode == 400) {
      return null;
    } else if (response.statusCode == 404) {
      return null;
    } else {
      return null;
    }
  }
}
