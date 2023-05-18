import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oyveotesi/base/service/navigation/navigation_service.dart';
import 'package:oyveotesi/base/service/translation/locale_keys.g.dart';
import 'package:oyveotesi/components/buttons/text_button.dart';
import 'package:oyveotesi/constants/navigation/navigation.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MainTextButton(
            buttonFunction: () {
              NavigationService.instance
                  .navigateToPageRemoveAll(path: NavigationConstants.login);
            },
            buttonWidget: Text(LocaleKeys.mainText_notFountPage.tr())),
      ),
    );
  }
}
