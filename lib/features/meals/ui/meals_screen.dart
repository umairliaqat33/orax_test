import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orax_test/core/constants/app_strings.dart';
import 'package:orax_test/features/meals/bloc/meal_bloc.dart';
import 'package:orax_test/features/meals/ui/widgets/meal_card.dart';

import '../bloc/meals_state.dart';
import '../bloc/meals_event.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => MealsBloc(), child: const _MealsView());
  }
}

class _MealsView extends StatelessWidget {
  const _MealsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          '${AppStrings.meal}s',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: const [
          Icon(Icons.favorite_border),
          SizedBox(width: 12),
          Icon(Icons.more_horiz),
          SizedBox(width: 16),
        ],
      ),
      body: BlocBuilder<MealsBloc, MealsState>(
        builder: (context, state) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.meals.length,
            itemBuilder: (context, index) {
              final meal = state.meals[index];

              return MealCard(
                meal: meal,
                onAdd: () {
                  context.read<MealsBloc>().add(AddFoodItem(meal.id));
                },
                onToggleEdit: () {
                  context.read<MealsBloc>().add(ToggleEditMeal(meal.id));
                },
                onRemoveItem: (itemIndex) {
                  context.read<MealsBloc>().add(
                    RemoveFoodItem(meal.id, itemIndex),
                  );
                },
                image: meal.image,
              );
            },
          );
        },
      ),
    );
  }
}
