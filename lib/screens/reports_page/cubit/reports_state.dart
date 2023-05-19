import 'package:flutter/material.dart';
import 'package:oyveotesi/screens/reports_page/model/ballot_box_list_model.dart';


@immutable
class ReportsState {
  const ReportsState({this.isLoading = false, this.ballotBoxList});
  final bool isLoading;
  final BallotBoxList? ballotBoxList;

  ReportsState copyWith({
    final bool? isLoading,
    final BallotBoxList? ballotBoxList,
  }) {
    return ReportsState(isLoading: isLoading ?? this.isLoading, ballotBoxList: ballotBoxList ?? this.ballotBoxList);
  }
}
