import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oyveotesi/base/models/base_model_view.dart';
import 'package:oyveotesi/base/service/translation/locale_keys.g.dart';
import 'package:oyveotesi/components/bottomsheet/report_bug_sender.dart';
import 'package:oyveotesi/components/bottomsheet/request_feature_bottom_sheet.dart';
import 'package:oyveotesi/constants/colors/constant_colors.dart';
import 'package:oyveotesi/constants/sizes/sizes.dart';

class OpenBottomSheet with BaseModelView {
  final TextStyle listTileTextStyleTitle =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  Future<void> openBottomSheet(BuildContext context) async {
    double pageWidth = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      constraints: BoxConstraints(
        minWidth: pageWidth,
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(pagePadding))),
      showDragHandle: true,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return ListView(
          shrinkWrap: true,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.mainText_reportBugTitle.tr(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.star_border,
                size: 35,
                color: mainColor,
              ),
              title: Text(
                LocaleKeys.mainText_voteToAppTitle.tr(),
                style: listTileTextStyleTitle,
              ),
              subtitle: Text(LocaleKeys.mainText_voteToAppSubtitle.tr()),
            ),
            ListTile(
              onTap: () {
                navService.navigateToBack();
                ReportBugSenderOpenSheet().openBottomSheet(context);
              },
              leading: const Icon(
                Icons.bug_report_outlined,
                size: 35,
                color: mainColor,
              ),
              title: Text(
                LocaleKeys.mainText_reportBugButtonTitle.tr(),
                style: listTileTextStyleTitle,
              ),
              subtitle: Text(LocaleKeys.mainText_reportBugButtonContext.tr()),
            ),
            ListTile(
              onTap: () {
                navService.navigateToBack();
                RequestFeatureOpenSheet().openBottomSheet(context);
              },
              leading: const Icon(
                Icons.comment_outlined,
                size: 35,
                color: mainColor,
              ),
              title: Text(
                LocaleKeys.mainText_feedBackButtonTitle.tr(),
                style: listTileTextStyleTitle,
              ),
              subtitle: Text(LocaleKeys.mainText_feedBackButtonContext.tr()),
            )
          ],
        );
      },
    );
  }
}
