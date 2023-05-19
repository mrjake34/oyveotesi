import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:oyveotesi/screens/reports_page/model/ballot_box_list_model.dart';

import '../../../constants/json/constants_json.dart';
import 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(const ReportsState(isLoading: true));

  Future<void> getList() async {
    final json = await rootBundle.loadString(ConstantsJson.testJson);
    final jsonDecoded = jsonDecode(json);
    BallotBoxList ballotBoxList = BallotBoxList.fromJson(jsonDecoded);
    emit(state.copyWith(isLoading: false, ballotBoxList: ballotBoxList));
  }
}
