import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreemTest2 extends StatelessWidget {
  const ScreemTest2({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Prueba Screem 2'),
              TextButton(onPressed: ()=> context.push('/screem1'), child: const Text('Cliquea aquí ir al Screem 111'))
            ],
          ),
        ),
      );
  }
}