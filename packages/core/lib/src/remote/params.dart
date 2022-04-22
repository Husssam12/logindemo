import 'package:network/p_http_client.dart';

abstract class Params {
  final CancelToken cancelToken = CancelToken();

  Map<String, dynamic> toMap();
}

class ParamsWrapper extends Params {
  final Map<String, dynamic> params;

  ParamsWrapper(this.params);

  @override
  Map<String, dynamic> toMap() => params;
}


abstract class FromDataParams extends Params {
  FormData toFromData();
}

class NoParams extends Params {
  @override
  Map<String, dynamic> toMap() => {};
}

class PagingParams extends Params {
  final int page;
  final int pageSize;

  PagingParams({
    this.page = 1,
    this.pageSize = 20,
  });

  @override
  Map<String, dynamic> toMap() => {
        'page': page,
        'pageSize': pageSize,
      };
}
