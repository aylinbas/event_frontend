enum Endpoints { baseUrl, add }

extension EndpointsExtension on Endpoints {
  String get rawValue {
    switch (this) {
      case Endpoints.baseUrl:
        return 'http://192.168.1.12:5001/api/products/getall';
      case Endpoints.add:
        return 'http://192.168.1.12:5001/api/products/Add';
    }
  }
}
