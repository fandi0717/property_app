// ignore_for_file: public_member_api_docs, sort_constructors_first

/// TODO : https://31sudirmansuites.com/apa-saja-contoh-investasi-properti/
/// MACAM - MACAM PROPERTI :
/// 1. RESIDENTIAL PROPERTY
/// 2. COMMERCIAL PROPERTY
/// 3. INDUSTRIAL PROPERTY
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'transaction_enum.dart';

class Property extends Equatable {
  /// [id]
  ///
  /// each property has a unique id to identify the property itself
  ///
  /// `ex : #881726478123`
  final String id;

  /// [name]
  ///
  /// each property has a name
  ///
  /// `ex : Candra Bhirawa`
  final String name;

  /// [location]
  ///
  /// each property is located in one location
  ///
  /// `ex : Lotus, Kavling A1, Blok B No. 4`
  final String location;

  /// [dateTarget]
  ///
  /// target payment date
  ///
  /// `ex : 25/11/2022, 09:00`
  final DateTime dateTarget;

  /// [price]
  ///
  /// each property has a price
  ///
  /// `ex :Rp 985.799.300`
  final double price;

  /// [transaction]
  ///
  /// `ex`
  ///  ```dart
  /// <Transaction double>{
  ///   Transaction.pemesanan = 100,
  ///   Transaction.administrasi = 50,
  ///   Transaction.pembangunan = 0
  ///   Transaction.serahTerima = 0
  /// }
  /// ```
  ///
  final Map<Transaction, double> transaction;

  /// [jenisProperty]
  ///
  /// `see : https://31sudirmansuites.com/apa-saja-contoh-investasi-properti/`
  /// `ex : "komersil`
  final String jenisProperty;

  /// [denda]
  ///
  /// Optional : jika [dateNow] melebihi tanggal [dateTarget]
  final double? denda;

  /// [dateNow]
  ///
  /// Date Sekarang
  final DateTime? dateNow;

  const Property({
    required this.id,
    required this.name,
    required this.location,
    required this.dateTarget,
    required this.price,
    required this.transaction,
    required this.jenisProperty,
    this.denda,
    this.dateNow,
  });

  Property copyWith({
    String? id,
    String? name,
    String? location,
    DateTime? dateTarget,
    double? price,
    Map<Transaction, double>? transaction,
    String? jenisProperty,
    double? denda,
    DateTime? dateNow,
  }) {
    return Property(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      dateTarget: dateTarget ?? this.dateTarget,
      price: price ?? this.price,
      transaction: transaction ?? this.transaction,
      jenisProperty: jenisProperty ?? this.jenisProperty,
      denda: denda ?? this.denda,
      dateNow: dateNow ?? this.dateNow,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'location': location,
      'date_target': dateTarget.millisecondsSinceEpoch,
      'price': price,
      'transaction': transaction,
      'jenis_property': jenisProperty,
      'denda': denda,
      'date_now': dateNow?.millisecondsSinceEpoch,
    };
  }

  factory Property.fromMap(Map<String, dynamic> map) {
    return Property(
      id: map['id'] as String,
      name: map['name'] as String,
      location: map['location'] as String,
      dateTarget: DateTime.parse(map['date_target'] as String),
      price: map['price'] as double,
      transaction: (map['transaction'] as Map<String, dynamic>).map(
          (key, value) => MapEntry(transactionValue[key]!, value as double)),
      jenisProperty: map['jenis_property'] as String,
      denda: map['denda'] != null ? map['denda'] as double : null,
      dateNow: map['date_now'] != null
          ? DateTime.parse(map['date_now'] as String)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Property.fromJson(String source) =>
      Property.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      location,
      dateTarget,
      price,
      transaction,
      jenisProperty,
      denda,
      dateNow,
    ];
  }
}
