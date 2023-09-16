import 'package:flutter/material.dart';
import 'package:todo_list/controller/register_controller.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final TextEditingController tfFullNameController = TextEditingController();
  final TextEditingController tfUserNameController = TextEditingController();
  final TextEditingController tfPasswordController = TextEditingController();
  final RegisterController registerController = RegisterController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Register',
              style: TextStyle(fontSize: 24, color: Colors.blue)),
          const SizedBox(height: 32),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('FullName'),
          ),
          TextField(
            controller: tfFullNameController,
          ),
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('UserName'),
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
              if (await registerController.register(
                  fullName: tfFullNameController.text,
                  userName: tfUserNameController.text,
                  password: tfPasswordController.text)) {
                Navigator.pop(context);
              }
              print(
                  '${tfFullNameController.text}/${tfUserNameController.text}/${tfPasswordController.text}');
            },
            child: Container(
              height: 52,
              width: MediaQuery.sizeOf(context).width,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text("Register"),
            ),
          ),
          const SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('You  have a account. '),
            GestureDetector(
              onTap: () {
                //Todo: navigation to register page when click
                Navigator.pop(context);
              },
              child: const Text(
                'Login',
                style:
                    TextStyle(fontWeight: FontWeight.w700, color: Colors.blue),
              ),
            )
          ]),
        ],
      ),
    ));
  }
}
