import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oyveotesi/base/service/translation/locale_keys.g.dart';
import 'package:oyveotesi/components/buttons/outline_icon_button.dart';
import 'package:oyveotesi/constants/colors/constant_colors.dart';
import 'package:oyveotesi/constants/sizes/sizes.dart';
import 'package:oyveotesi/screens/reports_page/model/ballot_box_list_model.dart';

import '../cubit/reports_cubit.dart';
import '../cubit/reports_state.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  BallotBoxList? _ballotBoxList;
  late final ReportsCubit reportsCubit;
  bool? isLoading;

  @override
  void initState() {
    super.initState();
    reportsCubit = ReportsCubit();
    reportsCubit.getList();
  }

  @override
  Widget build(BuildContext context) {
    final Size pageSize = MediaQuery.of(context).size;
    return BlocProvider<ReportsCubit>(
      create: (context) => reportsCubit,
      child: BlocConsumer<ReportsCubit, ReportsState>(
        listener: (context, state) {
          isLoading = state.isLoading;
          if (state.ballotBoxList is BallotBoxList) {
            _ballotBoxList = state.ballotBoxList;
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: BuildScaffold(
              pageSize: pageSize,
              ballotBoxList: _ballotBoxList ?? BallotBoxList(),
              isLoading: isLoading ?? true,
            ),
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
    required this.ballotBoxList,
    required this.isLoading,
  });

  final Size pageSize;
  final BallotBoxList ballotBoxList;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? Column(
            children: [
              Column(
                children: [
                  Container(
                    height: 60,
                    width: pageSize.width,
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ballotBoxList.school ?? "",
                          style: const TextStyle(fontSize: 17),
                        ),
                        Text(
                          "${ballotBoxList.district ?? ""} / ${ballotBoxList.city ?? ""}",
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 10),
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
                                child: Text(LocaleKeys.mainText_cumhurBaskanligi
                                    .tr()))),
                        const VerticalDivider(
                          color: dividerColor,
                        ),
                        Expanded(
                            child: Center(
                                child: Text(
                                    LocaleKeys.mainText_milletvekili.tr()))),
                      ],
                    ),
                  ),
                ],
              ),
              Flexible(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: pagePadding),
                  itemCount: ballotBoxList.ballotBoxes?.length,
                  itemBuilder: (context, index) {
                    BallotBoxes? boxList = ballotBoxList.ballotBoxes?[index];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                            "${boxList?.ballotLabel ?? 0} ${LocaleKeys.mainText_ballotBoxNo.tr()}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: boxList?.cb?.status == 4
                                  ? ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          disabledBackgroundColor: mainColor,
                                          disabledForegroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      buttonRadius))),
                                      onPressed: null,
                                      child: Text(
                                        LocaleKeys.mainText_comfirmed.tr(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ))
                                  : MainOutlineIconButton(
                                      buttonFunction: () {},
                                      iconWidget: const Icon(
                                        Icons.camera_alt,
                                        color: mainColor,
                                      ),
                                      textWidget: Text(
                                        LocaleKeys.mainText_addReport.tr(),
                                        style:
                                            const TextStyle(color: mainColor),
                                      )),
                            ),
                            const VerticalDivider(
                              color: dividerColor,
                            ),
                            Expanded(
                              child: boxList?.mv?.status == 4
                                  ? ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          disabledBackgroundColor: mainColor,
                                          disabledForegroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      buttonRadius))),
                                      onPressed: null,
                                      child: Text(
                                        LocaleKeys.mainText_comfirmed.tr(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ))
                                  : MainOutlineIconButton(
                                      buttonFunction: () {},
                                      iconWidget: const Icon(
                                        Icons.camera_alt,
                                        color: mainColor,
                                      ),
                                      textWidget: Text(
                                        LocaleKeys.mainText_addReport.tr(),
                                        style:
                                            const TextStyle(color: mainColor),
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
          )
        : const Center(
            child: CircularProgressIndicator.adaptive(),
          );
  }
}
