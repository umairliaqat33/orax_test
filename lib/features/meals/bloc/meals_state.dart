import 'package:equatable/equatable.dart';
import 'package:orax_test/core/constants/app_assets.dart';
import 'package:orax_test/core/constants/app_strings.dart';
import '../models/meal_model.dart';

class MealsState extends Equatable {
  final List<MealModel> meals;

  const MealsState({required this.meals});

  factory MealsState.initial() {
    return MealsState(meals: _initialMeals);
  }

  MealsState copyWith({List<MealModel>? meals}) {
    return MealsState(meals: meals ?? this.meals);
  }

  @override
  List<Object?> get props => [meals];
}

List<String> mealCardTitle = [
  AppAssets.halfSun,
  AppAssets.copyIcon,
  AppAssets.completeSun,
  AppAssets.sunDrowning,
  AppAssets.moonSimple,
  AppAssets.moonWithStars,
];
List<String> mealNames = [
  AppStrings.foodItem,
  AppStrings.bacon,
  AppStrings.meat,
  AppStrings.pulses,
  AppStrings.vegetables,
  AppStrings.foodItem,
];

final List<MealModel> _initialMeals = List.generate(
  6,
  (index) => MealModel(
    id: index,
    title: '${AppStrings.meal} ${index + 1}',
    image: mealCardTitle[index],
  ),
);
