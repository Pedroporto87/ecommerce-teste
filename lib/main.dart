import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Constantes/global_variaveis.dart';
import 'package:flutter_ecommerce/features/auth/screens/auth_screens.dart';
import 'package:flutter_ecommerce/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce Store',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariaveis.backgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const AuthScreen(),
    );
  }
}
