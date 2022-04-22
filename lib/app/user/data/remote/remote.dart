import 'package:logindemo/common/api_routes.dart';

import 'models/user_dto.dart';
import 'package:network/p_http_client.dart';
import 'package:core/core.dart';

class UserRemote {
  final Dio _dio;

  UserRemote(this._dio);

  Future<UserDto> login(Params params) async {
    final response = await _dio.post(
      APIRoutes.login,
      data: params.toMap(),
      cancelToken: params.cancelToken,
    );
    if (response.statusCode == 200 && response.data['code'] == 1) {
      throw AppNetworkResponseException(
        statusCode: 200,
        data: response.data['message'],
        exception: Exception('login'),
      );
    }

    return throwAppException(() => UserDto.fromAPI(response.data['data']));
  }
}
