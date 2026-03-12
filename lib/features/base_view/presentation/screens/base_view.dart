import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:unio_fit/core/resources/localization/localization_map.dart';
import 'package:unio_fit/features/base_view/presentation/screens/dashboard_screen.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/utils/helper.dart';
import 'widgets/menu_screen.dart';

class BaseView extends StatefulWidget {
  static String route = '/baseView';
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int selectedPageIndex = 0;
  late final ZoomDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = ZoomDrawerController();
  }

  List<Widget> _buildWidgets() {
    return [
      DashboardScreen(
        drawerController: _drawerController,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return WillPopScope(
      onWillPop: Helper.onWillPop,
      child: ZoomDrawer(
        controller: _drawerController,
        borderRadius: 24,
        style: DrawerStyle.style3,
        showShadow: true,
        openCurve: Curves.fastOutSlowIn,
        slideWidth: MediaQuery.of(context).size.width * 0.0,
        duration: const Duration(milliseconds: 500),
        angle: 0.0,
        menuScreenWidth: MediaQuery.of(context).size.width,
        menuBackgroundColor: isDark
            ? R.appColors.darkSurface
            : R.appColors.surface,
        mainScreen: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: IndexedStack(
            index: selectedPageIndex,
            children: _buildWidgets(),
          ),
        ),
        menuScreen: MenuScreen(
          drawerController: _drawerController,
        ),
      ),
    );
  }
}
