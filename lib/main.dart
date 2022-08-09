import 'package:blueboxinfosoft/resources/string_resources.dart';
import 'package:blueboxinfosoft/screens/firest_screen.dart';
import 'package:blueboxinfosoft/screens/secons_screen.dart';
import 'package:flutter/material.dart';
import './resources/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringResources.projectTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(),
      routes: {
        Routes.firstScreen: (ctx)=> const FirstScreen(),
        Routes.secondScreen: (ctx)=> const SecondScreen(),
      },
    );
  }
}


