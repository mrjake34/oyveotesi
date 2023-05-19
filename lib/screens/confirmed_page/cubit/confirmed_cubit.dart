import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:oyveotesi/constants/images/constants_images.dart';

import '../model/test_model.dart';
import 'confirmed_state.dart';

class ConfirmedCubit extends Cubit<ConfirmedState> {
  ConfirmedCubit() : super(const ConfirmedState(isLoading: true));

  Future<void> getList() async {
    final json = await rootBundle.loadString(ConstantsImages.testJson);
    final jsonDecoded = jsonDecode(json);
    BoxListTest boxListTest = BoxListTest.fromJson(jsonDecoded);
    emit(state.copyWith(isLoading: false, boxListTest: boxListTest));
  }
}
