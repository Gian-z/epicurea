import 'package:epicurea/view/pages/home_view.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = UserAgent(name: 'epicurea');
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.SWITZERLAND;
  OpenFoodAPIConfiguration.globalLanguages = <OpenFoodFactsLanguage>[
    OpenFoodFactsLanguage.ENGLISH
  ];

  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Epicurea',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(
        title: 'Epicurea',
      ),
    );
  }
}
