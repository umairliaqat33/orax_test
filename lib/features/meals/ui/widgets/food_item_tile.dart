import 'package:flutter/material.dart';
import 'package:orax_test/core/constants/app_strings.dart';
import '../../models/food_item_model.dart';

class FoodItemTile extends StatelessWidget {
  final FoodItemModel item;
  final bool isEditing;
  final VoidCallback onRemove;

  const FoodItemTile({
    super.key,
    required this.item,
    required this.isEditing,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              item.name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),

          Text(
            '${item.calories} ${AppStrings.kCal}',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),

          const SizedBox(width: 8),

          GestureDetector(
            onTap: isEditing ? onRemove : null,
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isEditing ? Colors.red.shade200 : Colors.black54,
              ),
              child: Icon(
                isEditing ? Icons.close : Icons.arrow_forward,
                size: 10,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
