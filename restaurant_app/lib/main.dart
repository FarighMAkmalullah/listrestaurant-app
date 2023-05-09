import 'package:flutter/material.dart';
import 'package:restaurant_app/screen/homepage.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/stores/restaurant.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => RestaurantProvider()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Homepage());
  }
}
