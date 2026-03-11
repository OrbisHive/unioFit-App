import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'core/router/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'core/resources/localization/localization_map.dart';
import 'core/utils/media_query_utils.dart';
import 'features/auth/presentation/screens/splash_screen.dart';
import 'features/base_view/presentation/screens/dashboard_screen.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: "app_name".L(),
          builder: (context, child) {
            final mediaQuery = MediaQuery.of(context);
            final botToastInit = BotToastInit();
            return MediaQuery(
              data: mediaQuery.copyWith(
                textScaler: MediaQueryUtils.getTextScaler(context),
              ),
              child: botToastInit(context, child),
            );
          },
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system, // Follows system theme
          // initialRoute: SplashScreen.route,
          initialRoute: DashboardScreen.route,
          getPages: AppRoutes.pages,
          unknownRoute: GetPage(
            name: '/not-found',
            page: () => Scaffold(
              appBar: AppBar(
                title: Text("error".L()),
              ),
              body: Center(
                child: Text("route_not_found".L()),
              ),
            ),
          ),
        );
      },
    );
  }
}
