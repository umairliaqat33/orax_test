import 'package:flutter/material.dart';

class TotalCaloriesRow extends StatelessWidget {
  final int totalCalories;

  const TotalCaloriesRow({super.key, required this.totalCalories});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Total Calories',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(
          '$totalCalories kcal',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
