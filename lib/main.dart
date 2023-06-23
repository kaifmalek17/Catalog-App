import 'package:flutter/material.dart';
import 'package:mine_app/pages/home_page.dart';
import 'package:mine_app/pages/login_page.dart';
import 'package:mine_app/utills/routes.dart';
import 'package:mine_app/widgets/theme.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: Mytheme.lighttheme,
      darkTheme: Mytheme.darktheme,
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        '/': (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(key: null,),
        MyRoutes.loginRoute: (context) => const LoginPage(),
      },
    );
  }
}
