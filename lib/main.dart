import 'package:flutter/material.dart';
import 'package:mine_app/core/store.dart';
import 'package:mine_app/pages/cart_page.dart';
import 'package:mine_app/pages/home_page.dart';
import 'package:mine_app/pages/login_page.dart';
import 'package:mine_app/utills/routes.dart';
import 'package:mine_app/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(
    VxState(
      store: MyStore(), // Use MyStore as the store
      child: MyApp(),
    ),
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
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartRoute: (context) => const CartPage(),
      },
    );
  }
}
