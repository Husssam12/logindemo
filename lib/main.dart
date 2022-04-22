import 'package:bootstrap/bootstrap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logindemo/router.dart';

import 'app.dart';

void main() async {
  bootstrap(
    () {
      defineRoutes(router);
      return const ProviderScope(
        child: App(),
      );
    },
  );
}
