import 'package:core/core.dart';
import 'package:logindemo/app/user/data/local/user_local_storage.dart';
import 'package:network/api_result.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/repo.dart';
import '../remote/remote.dart';

class UserRepo implements IUserRepo {
  UserRepo({required UserRemote userRemote, required UserStorage userStorage})
      : _userRemote = userRemote,
        _userStorage = userStorage;

  final UserRemote _userRemote;
  final UserStorage _userStorage;

  @override
  Future<ApiResult<User>> login(Params params) {
    return toApiResult(
      () {
        return _userRemote.login(params).then((value) async {
          final user = value.toModel();
          await _userStorage.write(user);
          return user;
        });
      },
    );
  }

  @override
  Stream<User?> get userStream => _userStorage.stream;

  @override
  User? get user => _userStorage.value;

  @override
  Future<void> logout() => _userStorage.delete();
}
