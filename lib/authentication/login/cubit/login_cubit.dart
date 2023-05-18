import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../base/models/base_model_view.dart';

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
  ) : super(LoginInitial());

  // Future<void> postLoginModel() async {
  //   if (loginKey.currentState?.validate() ?? false) {
  //     changeLoginState();
  //     final data = await service
  //         .postLoginModel(LoginModel(
  //             email: emailController.text.trim(),
  //             password: passwordController.text.trim()))
  //         .onError((DioError error, stackTrace) {
  //       changeLoginState();
  //       if (error.response?.statusCode == 400) {
  //         utils.errorSnackBar(LocaleKeys.errors_userNotFound.tr());
  //       } else {
  //         utils.errorSnackBar(LocaleKeys.errors_loginError.tr());
  //       }
  //       changeLoginState();
  //       return null;
  //     });
  //     changeLoginState();
  //     if (data is LoginResponseModel) {
  //       emit(LoginComplete(data));
  //     }
  //   } else {
  //     UtilsService.instance
  //         .errorSnackBar(LocaleKeys.errors_pleaseEnterAllField.tr());
  //     isLoginFail = true;
  //     emit(LoginValidate(isLoginFail));
  //   }
  // }

  // void changeLoginState() {
  //   isLoading = !isLoading;
  //   emit(LoginLoding(isLoading: isLoading));
  // }
}
