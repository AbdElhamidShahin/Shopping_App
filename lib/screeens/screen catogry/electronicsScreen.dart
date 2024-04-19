import 'package:flutter/material.dart';
import 'package:quran/widgets/catogry.dart';

class ElectronicsScreen extends StatelessWidget {
  const ElectronicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Catogaris(
        category: "electronics",
      ),
    );
  }
}
