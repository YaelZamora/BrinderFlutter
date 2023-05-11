import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(1, 60, 60, 60),
      body: Stack(
        children: [
          Positioned(
            bottom: size.height / 7,
            left: 20,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                color: Colors.purple,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              oNeonText(
                isSoftWrap: false,
                textColor: Colors.deepPurple,
                text: 'Brinder',
                fontWeight: FontWeight.bold,
                textSize: 50,
                blurRadius: 10,
              ),
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: size.width,
                    height: 400,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white30,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        TextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Nombre',
                          ),
                        ),
                        const Spacer(),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Contraseña',
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.indigoAccent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: MaterialButton(
                            onPressed: () => Navigator.popAndPushNamed(
                              context,
                              'principal',
                            ),
                            minWidth: size.width,
                            height: 50,
                            child: const Text(
                              'LOG IN',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
