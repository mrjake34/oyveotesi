import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../base/models/base_model_view.dart';
import '../../../constants/network/constants_network.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> with BaseModelView {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormBuilderState> loginKey;
  final BuildContext context;
  bool isLoginFail = false;
  // final ILoginService service;
  bool isLoading = false;

  LoginCubit(
    this.loginKey,
    this.emailController,
    this.passwordController,
    this.context,
  ) : super(LoginState());

  Dio dio = Dio();

  Future<void> getList() async {
    final response = await dio.get(ballotBoxListPath,
        options: Options(headers: {"Authorization": token}));
    print(response.statusCode);
    if (response.statusCode == 200) {
    } else if (response.statusCode == 400) {
    } else if (response.statusCode == 404) {
    } else {}
  }

  // void changeLoginState() {
  //   isLoading = !isLoading;
  //   emit(LoginLoding(isLoading: isLoading));
  // }
}
