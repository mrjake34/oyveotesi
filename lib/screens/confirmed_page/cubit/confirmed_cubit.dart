import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'confirmed_state.dart';

class ConfirmedCubit extends Cubit<ConfirmedState> {
  ConfirmedCubit() : super(ConfirmedInitial());
}
