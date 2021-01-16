import 'package:flutter/material.dart';
import 'package:flutter_games/screens/home_screen.dart';

import 'screens/tic_tac_toe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Games',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
