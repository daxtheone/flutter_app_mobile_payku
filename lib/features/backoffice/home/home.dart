import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  static const String name = 'home';
  final Widget navegationShell;

  const Home({
    super.key,
    required this.navegationShell
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navegationShell,
      bottomNavigationBar: Row(children: [
        FilledButton(onPressed: (){context.go('/home');}, child: Text('Home ')),
        FilledButton(onPressed: (){context.go('/products');}, child: Text('Productos ')),
        FilledButton(onPressed: (){context.go('/transactions');}, child: Text('transacciones ')),
      ],),
    );
  }
}

