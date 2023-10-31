import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userlist/provider/user.dart';
import 'package:userlist/routes/app_routes.dart';
import 'package:userlist/views/home.dart';
import 'package:userlist/views/user_form.dart';
import 'package:userlist/views/user_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Users(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Projeto Terrível',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          routes: {
            AppRoutes.HOME: (_) => const Home(),
            AppRoutes.USER_LIST: (_) => const UserList(),
            AppRoutes.USER_FORM: (_) => UserForm(),
          }),
    );
  }
}
