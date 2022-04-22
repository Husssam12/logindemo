import '../../app/user/application/facade.dart';
import '../../app/user/data/local/user_local_storage.dart';
import '../../app/user/data/remote/remote.dart';
import '../../app/user/data/repositories/repo.dart';
import '../../app/user/domain/repositories/repo.dart';
import '../../app/user/presentation/pages/login/bloc/login_bloc.dart';
import '../service_locator.dart';

Future<void> user() async {
  sl.registerSingleton<UserRemote>(UserRemote(sl()));

  sl.registerSingleton<UserStorage>(UserStorage(sl()));

  sl.registerSingleton<IUserRepo>(
    UserRepo(
      userRemote: sl(),
      userStorage: sl(),
    ),
  );

  sl.registerSingleton<UserFacade>(
    UserFacade(
      userRepo: sl(),
    ),
  );

  sl.registerFactory<LoginBloc>(
    () => LoginBloc(sl()),
  );
}
