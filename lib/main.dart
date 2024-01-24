import 'package:flutter/material.dart';
import 'package:random_cats/presentor/home_screen/home_screen.dart';
import 'package:random_cats/utils/hive_helper.dart';

import 'di/my_di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  HiveHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomeScreen(),
    );
  }
}
