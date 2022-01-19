import '../constants/enum/network_type_enum.dart';

extension NetworkTypeExtension on NetworkTypes? {
  String get methodType {
    switch (this) {
      case NetworkTypes.GET:
        return "GET";
      case NetworkTypes.POST:
        return "POST";
      default:
        throw "Error Text";
    }
  }
}
