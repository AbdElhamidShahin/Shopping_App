import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:quran/Cupit/cupit.dart';
import 'package:quran/Cupit/states.dart';

import 'cart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required List products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCupit(),
      child: BlocConsumer<AppCupit, AppState>(
        listener: (BuildContext context, AppState state) {},
        builder: (BuildContext context, AppState state) {
          final cupit = BlocProvider.of<AppCupit>(context);
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: cupit
                      .Screen[cupit.currentIndex], // Expanded for flexibility
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Colors.amber,
                ),
                BottomNavigationBarItem(
                  icon: Badge(
                    label: Consumer<Cart>(
                      builder: (context, cart, _) => Text(
                        cart.count.toString(),
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    child: Icon(Icons.shopping_cart),
                  ),
                  label: "Cart",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'favorite',
                  backgroundColor: Colors.amber,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                  backgroundColor: Colors.amber,
                ),
              ],
              currentIndex: cupit.currentIndex,
              selectedItemColor: Colors.amber,
              onTap: (index) {
                cupit.changeIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}
