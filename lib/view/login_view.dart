import 'package:flutter/material.dart';
import 'package:todo_list/controller/login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController tfUserNameController = TextEditingController();
  final TextEditingController tfPasswordController = TextEditingController();
  final LoginController loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Login', style: TextStyle(fontSize: 24, color: Colors.blue)),
          const SizedBox(height: 32),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Username'),
          ),
          TextField(
            controller: tfUserNameController,
          ),
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Password'),
          ),
          TextField(
            controller: tfPasswordController,
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () async {
              if (await loginController.login(
                  userName: tfUserNameController.text,
                  password: tfPasswordController.text)) {
                Navigator.pushReplacementNamed(context, 'home');
              }
            },
            child: Container(
              height: 52,
              width: MediaQuery.sizeOf(context).width,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text("Login"),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You don\'t have a account. '),
              GestureDetector(
                onTap: () {
                  //Todo: navigation to register page when click
                  Navigator.pushNamed(context, 'register');
                },
                child: Text(
                  'Create a account',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.blue),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
