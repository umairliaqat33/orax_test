import 'package:flutter/material.dart';
import 'package:orax_test/core/constants/colors.dart';
import 'core/navigation/app_router.dart';
import 'core/navigation/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.meals,
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.appScaffoldColor,
        useMaterial3: true,
      ),
    );
  }
}
