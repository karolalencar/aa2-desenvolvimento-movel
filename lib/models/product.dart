//import 'dart:convert';

//import 'package:aa2_desenvolvimento_movel/utils/uuid_utils.dart';

class Product {
  final int id;
  final String name;
  final String code;
  final int amount;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.code,
    required this.amount,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    List<dynamic> idBytes = json['id']['data'];
    int id = idBytes.fold<int>(0, (previousValue, element) {
      return (previousValue << 8) | element;
    });

    return Product(
      id: id,
      name: json['name'],
      code: json['code'],
      amount: json['amount'],
      description: json['description'],
    );
  }

  //String getUuidString() {
  //return convertBytesToUuid(this.)
  //}
}
