import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:oyveotesi/screens/reports_page/model/ballot_box_list_model.dart';

import '../../../constants/network/constants_network.dart';
import 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(const ReportsState(isLoading: true));
  Dio dio = Dio();
  Future<void> getList() async {
    final response = await dio.get(ballotBoxListPath,
        options: Options(headers: {"Authorization": token}));
    print(response.statusCode);
    if (response.statusCode == 200) {
      BallotBoxList ballotBoxList = BallotBoxList.fromJson(response.data);
      emit(state.copyWith(isLoading: false, ballotBoxList: ballotBoxList));
    } else if (response.statusCode == 400) {
    } else if (response.statusCode == 404) {
    } else {}
  }
}
