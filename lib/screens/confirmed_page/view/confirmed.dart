import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oyveotesi/base/service/translation/locale_keys.g.dart';
import 'package:oyveotesi/components/buttons/outline_icon_button.dart';
import 'package:oyveotesi/constants/colors/constant_colors.dart';
import 'package:oyveotesi/constants/sizes/sizes.dart';
import 'package:oyveotesi/screens/confirmed_page/model/test_list.dart';

import '../cubit/confirmed_cubit.dart';

class ConfirmedPage extends StatefulWidget {
  const ConfirmedPage({super.key});

  @override
  State<ConfirmedPage> createState() => _ConfirmedPageState();
}

class _ConfirmedPageState extends State<ConfirmedPage> {
  @override
  Widget build(BuildContext context) {
    final Size pageSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ConfirmedCubit(),
      child: buildScaffold(pageSize),
    );
  }

  Scaffold buildScaffold(Size pageSize) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 3,
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: pageSize.width,
                  padding: const EdgeInsets.only(left: 15),
                  child: const Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Örnek Okul",
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        "İlçe/İl",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      )
                    ],
                  ),
                ),
                Container(
                  color: const Color.fromARGB(255, 232, 232, 232),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Center(
                              child: Text(
                                  LocaleKeys.mainText_cumhurBaskanligi.tr()))),
                      const VerticalDivider(
                        color: dividerColor,
                      ),
                      Expanded(
                          child: Center(
                              child:
                                  Text(LocaleKeys.mainText_milletvekili.tr()))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 13,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: pagePadding),
              itemCount: testList.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        "${testList[index]} ${LocaleKeys.mainText_ballotBoxNo.tr()}"),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius:
                                    BorderRadius.circular(buttonRadius)),
                            child: Center(
                                child: Text(
                              LocaleKeys.mainText_comfirmed.tr(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        const VerticalDivider(
                          color: dividerColor,
                        ),
                        Expanded(
                          child: MainOutlineIconButton(
                              buttonFunction: () {},
                              iconWidget: const Icon(
                                Icons.camera_alt,
                                color: mainColor,
                              ),
                              textWidget: Text(
                                LocaleKeys.mainText_addReport.tr(),
                                style: const TextStyle(color: mainColor),
                              )),
                        ),
                      ],
                    ),
                    const Divider(
                      color: dividerColor,
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
