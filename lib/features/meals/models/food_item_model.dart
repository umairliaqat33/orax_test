import 'package:equatable/equatable.dart';

class FoodItemModel extends Equatable {
  final String name;
  final int calories;

  const FoodItemModel({required this.name, required this.calories});

  @override
  List<Object> get props => [name, calories];
}
