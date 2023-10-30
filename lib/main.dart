import 'dart:math';

import 'package:abhishek_doshi_portfolio/firebase_options.dart';
import 'package:abhishek_doshi_portfolio/router/router.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) {
    FirebaseAnalytics.instance
      ..setUserId(
        id: Random().nextInt(1000).toString(),
      )
      ..logEvent(
        name: 'app_open',
      );
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp.router(
        title: StringConst.APP_NAME,
        theme: AppTheme.lightThemeData,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
