import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      navigatorKey: Modular.navigatorKey,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.deepOrange)
      ),
      onGenerateRoute: Modular.generateRoute,
    );
  }
}