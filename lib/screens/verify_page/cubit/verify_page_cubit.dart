import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'verify_page_state.dart';

class VerifyPageCubit extends Cubit<VerifyPageState> {
  VerifyPageCubit() : super(const VerifyPageState(isLoading: true));

  Future<void> getVerifyItems() async {
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(isLoading: false));
  }
}
