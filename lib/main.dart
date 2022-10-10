import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:login_system/home/homePage.dart';
import 'package:login_system/login/loginPage.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Box<dynamic> settings = await Hive.openBox('settings');
  print('main function');
  if (settings.isNotEmpty) {
    runApp(const MyApp());
  } else {
    runApp(const MyLoginApp());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class MyLoginApp extends StatefulWidget {
  const MyLoginApp({Key? key}) : super(key: key);

  @override
  State<MyLoginApp> createState() => _MyLoginAppState();
}

class _MyLoginAppState extends State<MyLoginApp> {

  @override
  Widget build(BuildContext context) {
    print('_MyLoginAppState');
    return const MaterialApp(home: LoginPage());
  }
}

