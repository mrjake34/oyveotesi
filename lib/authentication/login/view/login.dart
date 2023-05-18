import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oyveotesi/authentication/login/cubit/login_cubit.dart';
import 'package:oyveotesi/base/service/translation/locale_keys.g.dart';
import 'package:oyveotesi/constants/images/constants_images.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) =>
          LoginCubit(loginKey, emailController, passwordController, context),
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              width: 500,
              height: 308,
              color: Colors.red,
              child: SvgPicture.asset(
                ConstantsImages.logoSvgImage,
                semanticsLabel: LocaleKeys.mainText_title.tr(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
