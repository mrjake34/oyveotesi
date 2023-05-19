import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oyveotesi/base/service/translation/locale_keys.g.dart';
import 'package:oyveotesi/constants/colors/constant_colors.dart';
import 'package:oyveotesi/constants/style/text_styles.dart';
import 'package:oyveotesi/screens/verify_page/cubit/verify_page_cubit.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  bool? isLoading;
  late final VerifyPageCubit _verifyPageCubit;

  @override
  void initState() {
    super.initState();
    _verifyPageCubit = VerifyPageCubit();
    _verifyPageCubit.getVerifyItems();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _verifyPageCubit,
      child: BlocConsumer<VerifyPageCubit, VerifyPageState>(
        listener: (context, state) {
          isLoading = state.isLoading;
        },
        builder: (context, state) {
          return BuildScaffold(
            isLoading: isLoading ?? true,
          );
        },
      ),
    );
  }
}

class BuildScaffold extends StatelessWidget {
  final bool isLoading;
  const BuildScaffold({
    super.key,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final Size pageSize = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading == true
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation(mainColor),
                    ),
                  ),
                  Text(
                    LocaleKeys.mainText_loadingReportTitle.tr(),
                    style: contextTitleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    LocaleKeys.mainText_pleaseWaitContext.tr(),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/five.png",
                    height: pageSize.height * 0.25,
                  ),
                  Text(
                    LocaleKeys.mainText_verifyNoConfirmationTitle.tr(),
                    style: contextTitleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    LocaleKeys.mainText_verifyNoConfirmationContext.tr(),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
    );
  }
}
