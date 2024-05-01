import 'package:flutter_test/flutter_test.dart';
import 'package:property_app/features/home/data/dataproviders/online/pesanan_data_provider.dart';
import 'package:property_app/features/home/data/models/property.dart';
import 'package:property_app/features/home/data/models/transaction_enum.dart';
import 'package:property_app/features/home/data/repositories/pesananan_repository.dart';

void main() {
  group('TEST GET PESANAN REPOSITORY ==>', () {
    late PesananPropertyRepository repository;

    setUp(() {
      repository = PesananPropertyRepository();
    });

    test('Decode JSON 2 Property', () {
      final result1 = repository
          .decodeJson2Property(PesananPropertyDataProvider.propertyOne);
      final result2 = repository
          .decodeJson2Property(PesananPropertyDataProvider.propertyTwo);
      final result3 = repository
          .decodeJson2Property(PesananPropertyDataProvider.propertyThree);

      expect(result1, isNotNull);
      expect(result1, isA<Property>());

      expect(result2, isNotNull);
      expect(result2, isA<Property>());

      expect(result3, isNotNull);
      expect(result3, isA<Property>());
    });

    test('Get ALL Propertys', () {
      final results = repository.getAllProperty();
      expect(results, isNotEmpty);
      expect(results, isA<List<Property>>());
    });

    group('Test Every Field Property ==>', () {
      late List<Property> results;

      setUp(() {
        results = repository.getAllProperty();
      });

      test('id', () {
        for (var property in results) {
          expect(property.id, isNotNull);
          expect(property.id, isA<String>());
        }
      });

      test('name', () {
        for (var property in results) {
          expect(property.name, isNotNull);
          expect(property.name, isA<String>());
        }
      });

      test('location', () {
        for (var property in results) {
          expect(property.location, isNotNull);
          expect(property.location, isA<String>());
        }
      });

      test('dateTarget', () {
        for (var property in results) {
          expect(property.dateTarget, isNotNull);
          expect(property.dateTarget, isA<DateTime>());
        }
      });

      test('price', () {
        for (var property in results) {
          expect(property.price, isNotNull);
          expect(property.price, isA<double>());
        }
      });

      test('jenisProperty', () {
        for (var property in results) {
          expect(property.jenisProperty, isNotNull);
          expect(property.jenisProperty, isA<String>());
        }
      });

      test('transaction', () {
        for (var property in results) {
          expect(property.transaction, isNotNull);
          expect(property.transaction, isA<Map<Transaction, double>>());
        }
      });

      test('denda', () {
        for (var i = 0; i < 3; i++) {
          if (i == 0) {
            expect(results[i].denda, isNull);
            continue;
          }

          expect(results[i].denda, isNotNull);
          expect(results[i].denda, isA<double>());
        }
      });

      test('dateNow', () {
        for (var property in results) {
          expect(property.dateNow, isNotNull);
          expect(property.dateNow, isA<DateTime>());
        }
      });
    });
  });
}
