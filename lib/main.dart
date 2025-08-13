import 'package:flutter/material.dart';
import 'package:xpert_funding_test/commons/constants.dart';
import 'package:xpert_funding_test/commons/theme.dart';
import 'package:xpert_funding_test/pages/dashboard_page.dart';

/// Entry point of the application
void main() {
  runApp(const MyApp());
}

/// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// The title of the application (used in Android task switcher)
      title: appTitle,

      /// Removes the "debug" banner in the top-right corner
      debugShowCheckedModeBanner: false,

      /// Global theme configuration
      theme: ThemeData(
        /// Make scaffold backgrounds transparent
        scaffoldBackgroundColor: Colors.transparent,

        /// Use the custom font defined in theme.dart
        fontFamily: fontFamily,
      ),

      /// The first screen to be displayed when the app starts
      home: const DashboardPage(),
    );
  }
}
