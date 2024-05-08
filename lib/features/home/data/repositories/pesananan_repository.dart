import '../dataproviders/online/pesanan_data_provider.dart';
import '../models/property.dart';

class PesananPropertyRepository {
  List<Property> getAllProperty() {
    List<Property> results = [];

    try {
      List<String> getJson = [
        PesananPropertyDataProvider.propertyOne,
        PesananPropertyDataProvider.propertyTwo,
        PesananPropertyDataProvider.propertyThree
      ];

      for (var json in getJson) {
        results.add(decodeJson2Property(json)!);
      }

      return results;
    } catch (e) {
      print(e);
      return List.empty();
    }
  }

  Property? decodeJson2Property(String json) {
    try {
      return Property.fromJson(json);
    } catch (e) {
      return null;
    }
  }
}
