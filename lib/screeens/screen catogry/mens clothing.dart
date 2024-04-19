import 'package:flutter/material.dart';
import 'package:quran/widgets/catogry.dart';

class MensClothing extends StatelessWidget {
  const MensClothing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Catogaris(
        category: "men's clothing",
      ),
    );
  }
}
