enum NetworkRoutes {
  LOGIN
}

extension NetworkRoutesExtension on NetworkRoutes{
  String get routeValue{
    switch (this) {
    case NetworkRoutes.LOGIN:
      return "login";
    default:
      throw Exception("Route not found");
    }
  }
}