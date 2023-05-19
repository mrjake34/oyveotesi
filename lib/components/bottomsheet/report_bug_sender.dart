import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oyveotesi/base/models/base_model_view.dart';
import 'package:oyveotesi/base/service/translation/locale_keys.g.dart';
import 'package:oyveotesi/constants/colors/constant_colors.dart';
import 'package:oyveotesi/constants/sizes/sizes.dart';

class ReportBugSenderOpenSheet with BaseModelView {
  final TextStyle listTileTextStyleTitle =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextEditingController addCommentController = TextEditingController();

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
          padding: const EdgeInsets.all(pagePadding),
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.mainText_reportBugSenderTitle.tr(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Text(
              LocaleKeys.mainText_addComment.tr(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              maxLines: 4,
              minLines: 4,
              controller: addCommentController,
              decoration: InputDecoration(
                hintText: LocaleKeys.mainText_addCommentDesc.tr(),
                enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(80, 33, 43, 55))),
                border: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(80, 33, 43, 55))),
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(80, 33, 43, 55)),
                          color: const Color.fromARGB(55, 33, 43, 55)),
                      child: const Icon(
                        Icons.video_call,
                        size: 30,
                      ),
                    )),
                const Spacer(
                  flex: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: redButtonColor,
                    ),
                    onPressed: () {},
                    child: Text(LocaleKeys.mainText_send.tr()))
              ],
            )
          ],
        );
      },
    );
  }
}
