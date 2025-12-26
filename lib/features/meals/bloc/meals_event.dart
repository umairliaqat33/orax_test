import 'package:equatable/equatable.dart';

abstract class MealsEvent extends Equatable {
  const MealsEvent();

  @override
  List<Object?> get props => [];
}

class AddFoodItem extends MealsEvent {
  final int mealId;

  const AddFoodItem(this.mealId);

  @override
  List<Object?> get props => [mealId];
}

class RemoveFoodItem extends MealsEvent {
  final int mealId;
  final int itemIndex;

  const RemoveFoodItem(this.mealId, this.itemIndex);

  @override
  List<Object?> get props => [mealId, itemIndex];
}

class ToggleEditMeal extends MealsEvent {
  final int mealId;

  const ToggleEditMeal(this.mealId);

  @override
  List<Object?> get props => [mealId];
}
