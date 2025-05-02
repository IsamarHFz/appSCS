import 'package:app_scs/screens/menu_screen.dart';
import 'package:app_scs/screens/crear_cuenta_screen.dart';
import 'package:app_scs/temas/app_tema.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTema.foundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            const SizedBox(height: 50.0),
            _signInButton(),
            const SizedBox(height: 30.0),
            _createAccountButton(),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppTema.iconColor, width: 2),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.person,
        color: AppTema.iconColor,
        size: 120.0,
      ),
    );
  }

  // Botón de inicio de sesión → redirige al menú principal
  Widget _signInButton() {
    return ElevatedButton(
      onPressed: () {
        final route = MaterialPageRoute(builder: (context) {
          return const MenuPrincipal();
        });
        Navigator.push(context, route);
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: AppTema.buttonColor,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Iniciar sesión",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: AppTema.iconColor,
          ),
        ),
      ),
    );
  }

  Widget _createAccountButton() {
    return ElevatedButton(
      onPressed: () {
        final route2 = MaterialPageRoute(builder: (context) {
          return const CrearCuenta();
        });
        Navigator.push(context, route2);
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: AppTema.buttonColor,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Crear cuenta",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: AppTema.iconColor,
          ),
        ),
      ),
    );
  }
}
