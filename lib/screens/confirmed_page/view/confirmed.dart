import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oyveotesi/base/service/translation/locale_keys.g.dart';
import 'package:oyveotesi/components/buttons/outline_icon_button.dart';
import 'package:oyveotesi/constants/colors/constant_colors.dart';
import 'package:oyveotesi/constants/sizes/sizes.dart';
import 'package:oyveotesi/screens/confirmed_page/model/test_list.dart';
import 'package:oyveotesi/screens/confirmed_page/model/test_model.dart';

import '../cubit/confirmed_cubit.dart';
import '../cubit/confirmed_state.dart';

class ConfirmedPage extends StatefulWidget {
  const ConfirmedPage({super.key});

  @override
  State<ConfirmedPage> createState() => _ConfirmedPageState();
}

class _ConfirmedPageState extends State<ConfirmedPage> {
  BoxListTest? _boxListTest;
  late final ConfirmedCubit confirmedCubit;

  @override
  void initState() {
    super.initState();
    confirmedCubit = ConfirmedCubit();
    confirmedCubit.getList();
  }

  @override
  Widget build(BuildContext context) {
    final Size pageSize = MediaQuery.of(context).size;
    return BlocProvider<ConfirmedCubit>(
      create: (context) => confirmedCubit,
      child: BlocConsumer<ConfirmedCubit, ConfirmedState>(
        listener: (context, state) {
          if (state.boxListTest is BoxListTest) {
            _boxListTest = state.boxListTest;
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: BuildScaffold(
                pageSize: pageSize, boxListTest: _boxListTest ?? BoxListTest()),
          );
        },
      ),
    );
  }
}

class BuildScaffold extends StatelessWidget {
  const BuildScaffold({
    super.key,
    required this.pageSize,
    required BoxListTest boxListTest,
  }) : _boxListTest = boxListTest;

  final Size pageSize;
  final BoxListTest _boxListTest;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
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
                          child:
                              Text(LocaleKeys.mainText_cumhurBaskanligi.tr()))),
                  const VerticalDivider(
                    color: dividerColor,
                  ),
                  Expanded(
                      child: Center(
                          child: Text(LocaleKeys.mainText_milletvekili.tr()))),
                ],
              ),
            ),
          ],
        ),
        Flexible(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: pagePadding),
            itemCount: _boxListTest.boxList?.length,
            itemBuilder: (context, index) {
              BoxList? boxList = _boxListTest.boxList?[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      "${boxList?.boxNo ?? 0} ${LocaleKeys.mainText_ballotBoxNo.tr()}"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: boxList?.cumhurBox == false
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    disabledBackgroundColor: mainColor,
                                    disabledForegroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            buttonRadius))),
                                onPressed: null,
                                child: Text(
                                  LocaleKeys.mainText_comfirmed.tr(),
                                  style: const TextStyle(color: Colors.white),
                                ))
                            : MainOutlineIconButton(
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
                      const VerticalDivider(
                        color: dividerColor,
                      ),
                      Expanded(
                        child: boxList?.milletBox == false
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    disabledBackgroundColor: mainColor,
                                    disabledForegroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            buttonRadius))),
                                onPressed: null,
                                child: Text(
                                  LocaleKeys.mainText_comfirmed.tr(),
                                  style: const TextStyle(color: Colors.white),
                                ))
                            : MainOutlineIconButton(
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
    );
  }
}
