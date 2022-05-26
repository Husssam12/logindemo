import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:logindemo/app/splash.dart';
import 'package:logindemo/app_manger/app_manger_widget.dart';
import 'package:logindemo/router.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return AppMangerWidget(
      navigatorKey: _key,
      child: ScreenUtilInit(
        builder: (c, _) => MaterialApp(
          navigatorKey: _key,
          title: 'Flutter Login Demo',
          theme: theme,
          initialRoute: SplashScreen.path,
          onGenerateRoute: router.generator,
        ),
      ),
    );
  }
}
