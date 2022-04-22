import 'package:core/core.dart';
import 'package:network/api_result.dart';

import '../entities/user.dart';

abstract class IUserRepo {
  Future<ApiResult<User>> login(Params params);

  Stream<User?> get userStream;

  User? get user;

  Future<void> logout();
}
