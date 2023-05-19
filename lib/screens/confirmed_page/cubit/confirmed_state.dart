import 'package:flutter/material.dart';

import '../model/test_model.dart';

@immutable
class ConfirmedState {
  const ConfirmedState({this.isLoading = false, this.boxListTest});
  final bool isLoading;
  final BoxListTest? boxListTest;

  ConfirmedState copyWith({
    final bool? isLoading,
    final BoxListTest? boxListTest,
  }) {
    return ConfirmedState(isLoading: isLoading ?? this.isLoading, boxListTest: boxListTest ?? this.boxListTest);
  }
}
