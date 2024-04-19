import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/Cupit/states.dart';
import 'package:quran/screeens/favorite_Screen.dart';
import 'package:quran/screeens/setings.dart';

import '../models/Home_Layout.dart';
import '../screeens/Cart_Shopping.dart';

class AppCupit extends Cubit<AppState> {
  AppCupit() : super(AppInitalState());

  static AppCupit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> Screen = [
    HomeLayout(products: [],),
    CartShopping(),
    Favorite(),
    settings_screen()
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(bottomNavigationBar());
  }
}
