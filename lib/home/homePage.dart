import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hoem Page'),),
      body: Center(
        child: Column(
        children: const [
          Text('Welcome to My app', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35),)

      ],
    ),
    ),
    );
  }
}
