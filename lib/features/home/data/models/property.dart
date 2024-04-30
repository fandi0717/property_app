// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'transaction_enum.dart';

class Property extends Equatable {
  final String id;
  final String name;
  final String location;
  final DateTime date;
  final double price;
  final double denda;
  final Map<Transaction, double> transaction;
  const Property({
    required this.id,
    required this.name,
    required this.location,
    required this.date,
    required this.price,
    required this.denda,
    required this.transaction,
  });

  Property copyWith({
    String? id,
    String? name,
    String? location,
    DateTime? date,
    double? price,
    double? denda,
    Map<Transaction, double>? transaction,
  }) {
    return Property(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      date: date ?? this.date,
      price: price ?? this.price,
      denda: denda ?? this.denda,
      transaction: transaction ?? this.transaction,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'location': location,
      'date': date.millisecondsSinceEpoch,
      'price': price,
      'denda': denda,
      'transaction': transaction,
    };
  }

  factory Property.fromMap(Map<String, dynamic> map) {
    return Property(
      id: map['id'] as String,
      name: map['name'] as String,
      location: map['location'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      price: map['price'] as double,
      denda: map['denda'] as double,
      transaction: Map<Transaction, double>.from(
          (map['transaction'] as Map<Transaction, double>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Property.fromJson(String source) =>
      Property.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      location,
      date,
      price,
      denda,
      transaction,
    ];
  }
}
