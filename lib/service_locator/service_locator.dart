import 'package:get_it/get_it.dart';
import 'package:logindemo/service_locator/features/_common.dart';

import 'features/prouduct.dart';
import 'features/user.dart';

final sl = GetIt.I;

Future<void> initLocator() async {
  await common();
  await user();
  await product();
}
