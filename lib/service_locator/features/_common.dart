import 'package:hive/hive.dart';
import 'package:network/p_http_client.dart';
import 'package:path_provider/path_provider.dart';

import '../../common/const.dart';
import '../../common/services/storage_service.dart';
import '../../common/services/storage_service_impl.dart';
import '../service_locator.dart';

Future<void> common() async {
  final path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);

  sl.registerSingleton<IStorageService>(
      StorageService(await Hive.openBox(kHiveKey)));

  await _regDioClient();
}

Future<void> _regDioClient() async {
  final DioClient dioClient = DioClient(kBaseURL);
  dioClient.interceptors.addAll([
    LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      requestBody: true,
    ),
  ]);
  sl.registerSingleton<Dio>(dioClient);
}
