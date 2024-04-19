import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/models/home_page.dart';
import 'package:quran/Serveis/up_date%20_productpage.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:quran/screeens/screen%20catogry/electronicsScreen.dart';

import 'login/animation1.dart';
import 'models/cart.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Like()),
        ChangeNotifierProvider(create: (context) => Cart()),
        // Add ThemeProvider
      ],
      child: MyApp(savedThemeMode: savedThemeMode),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({Key? key, this.savedThemeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(useMaterial3: true),
      dark: ThemeData.dark(useMaterial3: true),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Adaptive Theme Demo',
        theme: theme,

        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        home: HomeLite(),
        routes: {


          UpdateProductPage.id: (context) => UpdateProductPage(),
        },
      ),
    );
  }
}
