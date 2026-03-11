import 'package:flutter/material.dart';
import 'package:unio_fit/core/resources/localization/localization_map.dart';
import 'package:unio_fit/features/base_view/presentation/screens/dashboard_screen.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/utils/helper.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int selectedPageIndex = 0;

  List<Widget>listOfWidgets=[  DashboardScreen(),];
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return WillPopScope(
      onWillPop: Helper.onWillPop,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        body: IndexedStack(
        index:selectedPageIndex,
        children: listOfWidgets,
      ),

   ));
  }
}
