import 'dart:math';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final bool isDown;
  const LoginScreen({super.key, required this.isDown});

  @override
  Widget build(BuildContext context) {
    //final emailController = TextEditingController();
    //final passwordController = TextEditingController();

    return SingleChildScrollView(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 5.0, bottom: 10.0),
      child: Column(
        children: [
          Arrow(isDown: isDown),
          const Text(
            'Sign in',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 55,
            child: TextField(
              //controller: emailController,
              decoration: const InputDecoration(
                  labelText: '  E-mail',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)))),
              onChanged: (inputEmail) {},
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 55,
            child: TextField(
              //controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: '  Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)))),
              onChanged: (inputPassword) {},
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
              width: double.infinity,
              height: 55,
              child:
                  FilledButton(onPressed: () {}, child: const Text('Log in'))),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('No account?'),
              TextButton(
                  onPressed: () {
                    //context.pushNamed(RegisterScreen.routeName);
                  },
                  child: const Text('Sign up!')),
            ],
          )
        ],
      ),
    );
  }
}

class Arrow extends StatefulWidget {
  final bool isDown;
  const Arrow({Key? key, required this.isDown}) : super(key: key);

  @override
  State<Arrow> createState() => _ArrowState();
}

class _ArrowState extends State<Arrow> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: widget.isDown ? 40 : 20,
      width: 50,
      child: Transform.rotate(
        angle: widget.isDown ? pi : 0,
        child: const Icon(Icons.arrow_drop_up, size: 30),
      ),
    );
  }
}
