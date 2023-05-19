import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:oyveotesi/authentication/login/cubit/login_cubit.dart';
import 'package:oyveotesi/base/models/base_model_view.dart';
import 'package:oyveotesi/base/service/translation/locale_keys.g.dart';
import 'package:oyveotesi/components/buttons/main_elevated_button.dart';
import 'package:oyveotesi/components/buttons/text_button.dart';
import 'package:oyveotesi/constants/images/constants_images.dart';
import 'package:oyveotesi/constants/navigation/navigation.dart';
import 'package:oyveotesi/constants/sizes/sizes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with BaseModelView {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final pageHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) =>
          LoginCubit(loginKey, emailController, passwordController, context),
      child: buildScaffold(pageHeight),
    );
  }

  Widget buildScaffold(double pageHeight) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(pagePadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: pageHeight * 0.15,
                ),
                SizedBox(
                  height: pageHeight * 0.14,
                  child: SvgPicture.asset(
                    ConstantsImages.logoSvgImage,
                    semanticsLabel: LocaleKeys.mainText_title.tr(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormBuilder(
                    key: loginKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          autofillHints: const [AutofillHints.email],
                          decoration: InputDecoration(
                            labelText: LocaleKeys.mainText_eMail.tr(),
                            border: const OutlineInputBorder(),
                            enabledBorder: const OutlineInputBorder(),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.email(
                                errorText:
                                    LocaleKeys.errorText_enterValidEmail.tr()),
                            FormBuilderValidators.required(
                                errorText: LocaleKeys
                                    .errorText_requiredEmailLogin
                                    .tr())
                          ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          textInputAction: TextInputAction.done,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          autofillHints: const [AutofillHints.password],
                          decoration: InputDecoration(
                            labelText: LocaleKeys.mainText_password.tr(),
                            border: const OutlineInputBorder(),
                            enabledBorder: const OutlineInputBorder(),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: LocaleKeys
                                    .errorText_requiredPasswordLogin
                                    .tr())
                          ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MainElevatedButton(
                                buttonFunction: () {
                                  if (loginKey.currentState?.validate() ??
                                      false) {
                                    navService.navigateToPageRemoveAll(
                                        path: NavigationConstants.homePage);
                                  }
                                },
                                buttonWidget:
                                    Text(LocaleKeys.mainText_login.tr()),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MainTextButton(
                            buttonFunction: () {},
                            buttonWidget:
                                Text(LocaleKeys.mainText_forgotPassword.tr())),
                        const SizedBox(
                          height: 5,
                        ),
                        MainTextButton(
                            buttonFunction: () {},
                            buttonWidget: Text(LocaleKeys.mainText_signUp.tr()))
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
