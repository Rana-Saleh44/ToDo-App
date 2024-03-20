import 'package:flutter/material.dart';
import 'package:todo_app/constansts/colors.dart';

import 'screens/TodoScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: powderBlueColor,
        scaffoldBackgroundColor: powderBlueColor,
        appBarTheme: AppBarTheme(
          backgroundColor: navyBlueColor,
        ),
      ),
      home: TodoScreen(),
    );
  }
}
