import 'package:flutter/material.dart';
import 'package:userlist/views/user_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Terrível',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const UserList(),
    );
  }
}
