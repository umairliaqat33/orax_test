import 'package:flutter/material.dart';
import 'package:orax_test/features/meals/ui/widgets/food_item_tile.dart';
import 'package:orax_test/features/meals/ui/widgets/header_section.dart';
import 'package:orax_test/features/meals/ui/widgets/total_calorie_row.dart';
import '../../models/meal_model.dart';

class MealCard extends StatelessWidget {
  final MealModel meal;
  final VoidCallback onAdd;
  final String image;
  final VoidCallback onToggleEdit;
  final Function(int index) onRemoveItem;

  const MealCard({
    super.key,
    required this.meal,
    required this.onAdd,
    required this.onToggleEdit,
    required this.onRemoveItem,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.only(bottom: 8, left: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(
            title: meal.title,
            isEditing: meal.isEditing,
            onAdd: onAdd,
            onToggleEdit: onToggleEdit,
            image: image,
            showEdit: meal.items.isNotEmpty,
          ),

          if (meal.items.isNotEmpty)
            Padding(
              padding: EdgeInsetsGeometry.only(right: 8, top: 12),
              child: Column(
                children: [
                  ...List.generate(
                    meal.items.length,
                    (index) => FoodItemTile(
                      item: meal.items[index],
                      isEditing: meal.isEditing,
                      onRemove: () => onRemoveItem(index),
                    ),
                  ),
                  const SizedBox(height: 12),

                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TotalCaloriesRow(totalCalories: meal.totalCalories),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
