import 'package:expense_tracker/login/cubit/cubit/login_cubit.dart';
import 'package:expense_tracker/widget/cubit_widget.dart';
import 'package:flutter/material.dart';

class LoginView extends CubitWidget<LoginCubit, LoginState> {
  const LoginView({super.key});


  @override
  Widget build(BuildContext context, LoginCubit cubit, LoginState state) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            const SizedBox(height: 20),
            const Text('Login', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // cubit.login();
              },
              child: const Text('Login'),
            ),
          ],),
        ),
      ),
    );
  }
}
