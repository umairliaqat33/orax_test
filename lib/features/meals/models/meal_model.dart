import 'package:equatable/equatable.dart';
import 'food_item_model.dart';

class MealModel extends Equatable {
  final int id;
  final String title;
  final String image;
  final List<FoodItemModel> items;
  final bool isEditing;

  const MealModel({
    required this.id,
    required this.title,
    this.items = const [],
    this.isEditing = false,
    required this.image,
  });

  int get totalCalories => items.fold(0, (sum, item) => sum + item.calories);

  MealModel copyWith({List<FoodItemModel>? items, bool? isEditing}) {
    return MealModel(
      id: id,
      title: title,
      items: items ?? this.items,
      isEditing: isEditing ?? this.isEditing,
      image: image,
    );
  }

  @override
  List<Object> get props => [id, title, items, isEditing];
}
