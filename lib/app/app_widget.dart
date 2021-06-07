import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      navigatorKey: Modular.navigatorKey,
      builder: BotToastInit(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.deepOrange)
      ),
      navigatorObservers: [
        // FirebaseAnalyticsObserver(analytics: analytics),
        BotToastNavigatorObserver(),
      ],
      onGenerateRoute: Modular.generateRoute,
    );
  }
}