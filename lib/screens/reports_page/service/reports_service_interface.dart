import 'package:dio/dio.dart';
import 'package:oyveotesi/screens/reports_page/model/ballot_box_list_model.dart';

abstract class IReportsService {
  IReportsService();

  Future<BallotBoxList?> getBallotBoxList();
}
