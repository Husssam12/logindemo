import 'package:core/core.dart';
import 'package:network/api_result.dart';

import '../domain/entities/user.dart';
import '../domain/repositories/repo.dart';

class UserFacade {
  final IUserRepo _userRepo;

  UserFacade({required IUserRepo userRepo}) : _userRepo = userRepo;

  Future<ApiResult<User>> login(Params params) {
    return _userRepo.login(params);
  }

  Future<void> logout() {
    return _userRepo.logout();
  }

  Stream<User?> get userStream => _userRepo.userStream;

  User? get user => _userRepo.user;
}
