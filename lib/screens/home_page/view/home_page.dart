import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oyveotesi/components/bottomsheet/report_bug_bottom_sheet.dart';
import 'package:oyveotesi/constants/urls/urls.dart';
import 'package:oyveotesi/screens/profile/view/profile_page.dart';
import 'package:oyveotesi/screens/reports_page/view/reports_page.dart';
import 'package:oyveotesi/screens/verify_page/view/verify_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../base/service/translation/locale_keys.g.dart';
import '../../../base/service/utils/utils.dart';
import '../../../constants/colors/constant_colors.dart';
import '../../resource_page/view/resource_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
      const ReportsPage(),
      const VerifyPage(),
      const ResourcePage(),
      const ProfilePage()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
          activeColorPrimary: mainColor,
          inactiveColorPrimary: mainColor,
          icon: const Icon(Icons.upload_file),
          title: LocaleKeys.mainText_reports.tr()),
      PersistentBottomNavBarItem(
          activeColorPrimary: mainColor,
          inactiveColorPrimary: mainColor,
          icon: const Icon(Icons.fact_check_outlined),
          title: LocaleKeys.mainText_verify.tr()),
      PersistentBottomNavBarItem(
          activeColorPrimary: mainColor,
          inactiveColorPrimary: mainColor,
          icon: const Icon(Icons.help_center_outlined),
          title: LocaleKeys.mainText_resource.tr()),
      PersistentBottomNavBarItem(
        activeColorPrimary: mainColor,
        inactiveColorPrimary: mainColor,
        icon: const Icon(
          Icons.perm_identity,
        ),
        title: LocaleKeys.mainText_profile.tr(),
      ),
    ];
  }

  Future<void> callCallCenter() async {
    if (!await launchUrl(Uri.parse(callCenterNumber),
        mode: LaunchMode.externalNonBrowserApplication)) {
      UtilsService.instance
          .errorSnackBar(LocaleKeys.errorText_errorWhileCalling.tr());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.mainText_title.tr()),
        actions: [
          IconButton(
              onPressed: () {
                OpenBottomSheet().openBottomSheet(context);
              },
              icon: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: mainColor)),
                child: const Icon(
                  Icons.bug_report_outlined,
                  color: mainColor,
                  size: 31,
                ),
              )),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)))),
              onPressed: () {
                callCallCenter();
              },
              icon: const Icon(Icons.phone),
              label: Text(LocaleKeys.mainText_callCenter.tr())),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: PersistentTabView(
        context,
        screens: _buildScreens(),
        items: _navBarItems(),
        controller: _controller,
        navBarStyle: NavBarStyle.style3,
      ),
    );
  }
}
