import 'package:event_frontend/core/utility/endpoint_utils.dart';
import 'package:vexana/vexana.dart';

import 'error_model.dart';

class NetworkService {
  static final NetworkService instance = NetworkService._init();

  static INetworkManager? _networkManager;
  final String _baseUrl = Endpoints.baseUrl.rawValue;

  NetworkService._init();

  Future<INetworkManager> get networkManager async {
    if (_networkManager != null) {
      return _networkManager!;
    } else {
      await _initialize();
      return _networkManager!;
    }
  }

  Future _initialize() async {
    final baseOptions = BaseOptions(
      baseUrl: _baseUrl,
      followRedirects: false,
      sendTimeout: 200000,
      receiveTimeout: 200000,
      connectTimeout: 90000,
      validateStatus: (status) {
        return status! != 401;
      },
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    _networkManager = NetworkManager(
      isEnableLogger: true,
      options: baseOptions,
      errorModel: APIErrorModel(),
    );
  }
}
