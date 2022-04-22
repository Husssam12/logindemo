import 'dart:async';
import 'package:logindemo/app/products/presentation/pages/products_screen.dart';
import 'package:logindemo/app/user/presentation/pages/login/login.dart';
import 'package:logindemo/service_locator/service_locator.dart' as sl;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../router.dart';
import 'app_manger_bloc.dart';

class AppMangerWidget extends StatelessWidget {
  const AppMangerWidget({
    Key? key,
    required this.child,
    required this.navigatorKey,
  }) : super(key: key);
  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppMangerBloc(
        doBeforeOpen: _doBeforeOpen,
      )..add(AppMangerStarted()),
      child: Builder(
          builder: (context) => BlocListener<AppMangerBloc, AppMangerState>(
                listener: _listener,
                child: child,
              )),
    );
  }

  void _listener(_, state) {
    if (state.appState == AppState.unAuthenticated) {
      router.navigateTo(
        navigatorKey.currentState!.context,
        LoginScreen.path,
        replace: true,
      );
    } else {
      router.navigateTo(
        navigatorKey.currentState!.context,
        ProductsScreen.path,
        replace: true,
      );
    }
  }

  Future<void> _doBeforeOpen() async {
    await sl.initLocator();
  }
}
