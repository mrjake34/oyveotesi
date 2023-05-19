import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oyveotesi/screens/confirmed_page/view/confirmed.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../base/service/translation/locale_keys.g.dart';
import '../../../constants/colors/constant_colors.dart';

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
      ConfirmedPage(),
      Container(
        color: Colors.amber,
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.red,
      ),
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
          title: LocaleKeys.mainText_confimation.tr()),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.mainText_title.tr()),
        actions: [
          IconButton(
              onPressed: () {},
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
              onPressed: () {},
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
