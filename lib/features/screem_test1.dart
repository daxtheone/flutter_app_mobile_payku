import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreemTest1 extends StatelessWidget {
  const ScreemTest1({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Prueba Screem 1'),
              TextButton(onPressed: ()=> context.push('/screem2'), child: const Text('Cliquea aquí ir al Screem'))
            ],
          ),
        ),
      );
  }
}