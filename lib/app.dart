import 'package:flutter/material.dart';
import 'package:todo_list/view/home_view.dart';
import 'package:todo_list/view/login_view.dart';
import 'package:todo_list/view/register_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'login',
      routes: {
        'home': (context) => const HomeView(),
        'login': (context) => LoginView(),
        'register': (context) => RegisterView()
      },
    );
  }
}
