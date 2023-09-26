import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = '/register_screen';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Pantalla de registro',
          style: TextStyle(
            fontSize: 24.0
          ),
        ),
      ),
    );
  }
}
