import 'package:logindemo/app/products/application/facade.dart';
import 'package:logindemo/app/products/data/remote/data_sources/product_remote.dart';
import 'package:logindemo/app/products/data/repositories/repo.dart';

import '../../app/products/domain/repositories/repo.dart';
import '../service_locator.dart';

Future<void> product() async {
  sl.registerSingleton<ProductRemote>(ProductRemote(sl()));

  sl.registerSingleton<IProductRepo>(
    ProductRepo(
      sl(),
    ),
  );

  sl.registerSingleton<ProductFacade>(
    ProductFacade(
      sl(),
    ),
  );
}
