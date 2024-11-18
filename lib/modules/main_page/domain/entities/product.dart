import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  final String name;
  final double? price;
  final String imageUrl;

  bool get isNotForSale => price == null || price == 0;

  @override
  List<Object?> get props => [name, price, imageUrl];
}
