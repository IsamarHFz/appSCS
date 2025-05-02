import 'package:app_scs/HomeScreen.dart';
import 'package:app_scs/screens/menu_screen.dart';
import 'package:app_scs/screens/perfil_screen.dart';
import 'package:app_scs/screens/sudaderas.dart';
import 'package:app_scs/temas/app_tema.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  final Widget body;
  final int selectedIndex;

  const BaseScreen({Key? key, required this.body, this.selectedIndex = 0})
      : super(key: key);

  @override
  BaseScreenState createState() => BaseScreenState();
}

class BaseScreenState extends State<BaseScreen> {
  void openScreen(BuildContext context, int index) {
    if (index == widget.selectedIndex) return;

    late Widget screen;
    switch (index) {
      case 0:
        screen = const MenuPrincipal();
        break;
      case 1:
        screen = const Sudaderas();
        break;
      case 2:
        screen = const PerfilScreen();
        break;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => BaseScreen(body: screen, selectedIndex: index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTema.foundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(""),
          backgroundColor: Colors.transparent,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                decoration: AppTema.foundColor,
                child: Text(
                  'Menú',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.contact_mail),
                title: const Text('Contáctanos'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Sudaderas()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_2),
                title: const Text('Perfil'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PerfilScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Cerrar sesión'),
                onTap: () async {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
        body: widget.body,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: widget.selectedIndex,
          onTap: (index) => openScreen(context, index),
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(
              color: Colors.blueAccent, fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: 'Carrito',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2,
              ),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}