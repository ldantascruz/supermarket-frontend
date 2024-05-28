import 'dart:ui' as ui;


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/config/constants/app.bindings.dart';
import 'core/config/constants/app.resources.dart';
import 'core/config/constants/app.routes.dart';
import 'core/config/constants/app.themes.dart';
import 'feature/splash/splash.routes.dart';
import 'i18n/resources.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    R.load(ui.PlatformDispatcher.instance.locale);
    final designSize = MediaQuery.of(context).size;

    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      child: GetMaterialApp(
        title: R.strings.mySupermarket,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: AppThemes.themeData,
        initialBinding: AppBindings(),
        getPages: AppRoutes.routes,
        initialRoute: SplashRoutes.splash,
      ),
    );
  }
}
