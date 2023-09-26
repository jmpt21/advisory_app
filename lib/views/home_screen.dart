import 'package:advisory_app/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double screenHeight;
  bool isDown = false;
  double loginHeight = 60.0; // Altura de la pantalla de inicio de sesión

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Pantalla de inicio
          Container(
            height: screenHeight,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Pantalla de inicio',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Pantalla de inicio de sesión
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                )
              ),
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              height: loginHeight,
              width: double.infinity,

              child: LoginScreen(isDown: isDown)
            ),
          ),
          // GestureDetector para detectar el deslizamiento hacia arriba
          GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.delta.dy < 0) {
                setState(() {
                  loginHeight = screenHeight * 0.50; // Altura deseada para la pantalla de inicio de sesión
                  isDown = true;
                });
              }

              if (details.delta.dy > 0){
                SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
                setState(() {
                  loginHeight = 60.0; // Altura original de la pantalla de inicio de sesión
                  isDown = false;
                });
              }
            },
            onVerticalDragEnd: (details) {
              if (details.velocity.pixelsPerSecond.dy < 300) {
                setState(() {
                  loginHeight = screenHeight * 0.50; // Altura deseada para la pantalla de inicio de sesión
                  isDown = true;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
