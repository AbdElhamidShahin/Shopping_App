import 'package:flutter/material.dart';
import 'package:quran/widgets/catogry.dart';

class WomensClothing extends StatelessWidget {
  const WomensClothing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Catogaris(
        category: "women's clothing",
      ),
    );
  }
}
