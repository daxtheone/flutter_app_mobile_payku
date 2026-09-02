import 'package:flutter/material.dart';

import 'menu/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina homeee'),
        automaticallyImplyLeading: false,
      ),
      body: Placeholder(),
      endDrawer: SideMenu(), // <- aqui va nuestra pagina con el codigo del menu
    );
  }
}