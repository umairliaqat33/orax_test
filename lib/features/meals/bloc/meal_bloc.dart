import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/food_item_model.dart';
import 'meals_event.dart';
import 'meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  MealsBloc() : super(MealsState.initial()) {
    on<AddFoodItem>(_onAddFoodItem);
    on<RemoveFoodItem>(_onRemoveFoodItem);
    on<ToggleEditMeal>(_onToggleEditMeal);
  }

  void _onAddFoodItem(AddFoodItem event, Emitter<MealsState> emit) {
    final updatedMeals = state.meals.map((meal) {
      if (meal.id == event.mealId) {
        final updatedItems = List<FoodItemModel>.from(meal.items)
          ..add(_dummyFoodItem(meal.items.length % 6));

        return meal.copyWith(items: updatedItems);
      }
      return meal;
    }).toList();

    emit(state.copyWith(meals: updatedMeals));
  }

  void _onRemoveFoodItem(RemoveFoodItem event, Emitter<MealsState> emit) {
    final updatedMeals = state.meals.map((meal) {
      if (meal.id == event.mealId) {
        final updatedItems = List<FoodItemModel>.from(meal.items)
          ..removeAt(event.itemIndex);

        return meal.copyWith(items: updatedItems);
      }
      return meal;
    }).toList();

    emit(state.copyWith(meals: updatedMeals));
  }

  void _onToggleEditMeal(ToggleEditMeal event, Emitter<MealsState> emit) {
    final updatedMeals = state.meals.map((meal) {
      if (meal.id == event.mealId) {
        return meal.copyWith(isEditing: !meal.isEditing);
      }
      return meal;
    }).toList();

    emit(state.copyWith(meals: updatedMeals));
  }

  FoodItemModel _dummyFoodItem(int indexToAdd) {
    return FoodItemModel(
      name: mealNames[indexToAdd],
      calories: indexToAdd * 120,
    );
  }
}
