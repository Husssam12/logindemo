import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:logindemo/app/products/presentation/pages/products_screen.dart';
import 'package:logindemo/app/splash.dart';
import 'package:logindemo/app/user/presentation/pages/login/login.dart';

final router = FluroRouter();

void defineRoutes(FluroRouter router) {
  router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const Scaffold(body: Center(child: Text('Route not found')));
  });
  router.define(LoginScreen.path, handler: LoginScreen.handler);
  router.define(SplashScreen.path, handler: SplashScreen.handler);
  router.define(ProductsScreen.path, handler: ProductsScreen.handler);
}
