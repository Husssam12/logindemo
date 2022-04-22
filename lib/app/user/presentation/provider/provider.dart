import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logindemo/app/user/application/facade.dart';
import 'package:logindemo/service_locator/service_locator.dart';

import '../../domain/entities/user.dart';

final userStateProvider =
    StateNotifierProvider.autoDispose<UserProvider, User?>(
  (ref) {
    return UserProvider(sl());
  },
);

class UserProvider extends StateNotifier<User?> {
  UserProvider(this._facade) : super(_facade.user) {
    _subscribeToUser();
  }

  void _subscribeToUser() {
    _subscription = _facade.userStream.listen((user) {
      if (user != null) {
        state = user;
      }
    });
  }

  final UserFacade _facade;
  late final StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
