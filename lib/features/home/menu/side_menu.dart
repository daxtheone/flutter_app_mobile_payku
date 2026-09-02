import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    // para tener un tamaño de paging optimo para iphone y android
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      // selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        /*setState(() {
                     // navDrawerIndex = value;
                   });*/
        final menuItem = appMenuItems[value];
        // Aqui nos permite navegar a la opcion seleccionada
        Navigator.pop(context); // cierra el drawer como route
        context.push(menuItem.link);
      },
      footer: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(height: 1,),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Cerrar Sesión'),
              onTap: (){
                Navigator.pop(context);
                context.go('/');
              },
            )
          ],
        ),
      ),
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
          child: Text('Main'),
        ),
        ...appMenuItems
            .sublist(0, 3)
            .map(
              (item) => NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          ),
        ),
        Padding(padding: EdgeInsets.fromLTRB(28, 16, 28, 10), child: Divider()),
        Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('More Options'),
        ),
        ...appMenuItems
            .sublist(3)
            .map(
              (item) => NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          ),
        ),
      ],
    );
  }
}