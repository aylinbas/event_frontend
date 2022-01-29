enum Endpoints { baseUrl }

extension EndpointsExtension on Endpoints {
  String get rawValue {
    switch (this) {
      case Endpoints.baseUrl:
        return 'https://192.168.1.12:5001/api/products';
    }
  }
}
