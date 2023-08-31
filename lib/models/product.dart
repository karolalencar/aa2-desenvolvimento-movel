import 'dart:typed_data';

class Product {
  final String id;
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
    final bufferData = json['id']['data'];

    final bufferBytes = Uint8List.fromList(List<int>.from(bufferData));

    final uuid = _convertBytesToUuid(bufferBytes);

    return Product(
      id: uuid,
      name: json['name'],
      code: json['code'],
      amount: json['amount'],
      description: json['description'],
    );
  }

  static String _convertBytesToUuid(Uint8List bytes) {
    final hexDigits =
        bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0'));
    final uuidString = hexDigits.join('');

    return '$uuidString';
  }
}
