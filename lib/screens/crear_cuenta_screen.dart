import 'package:app_scs/temas/app_tema.dart';
import 'package:flutter/material.dart';

class CrearCuenta extends StatefulWidget {
  const CrearCuenta({super.key});

  @override
  State<CrearCuenta> createState() => _CrearCuentaState();
}

class _CrearCuentaState extends State<CrearCuenta> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reEnterPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTema.foundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50.0),
                  _icon(),
                  const SizedBox(height: 50.0),
                  _inputField("Usuario", usernameController),
                  const SizedBox(height: 30.0),
                  _inputField("Email", emailController),
                  const SizedBox(height: 30.0),
                  _inputField("Contraseña", passwordController, isPassword: true),
                  const SizedBox(height: 30.0),
                  _inputField("Escriba nuevamente la contraseña", reEnterPassController, isPassword: true),
                  const SizedBox(height: 30.0),
                  _signInButton(context),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
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

  Widget _inputField(String hintText, TextEditingController controller, {bool isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18.0),
      borderSide: const BorderSide(color: AppTema.iconColor),
    );
    return TextField(
      style: const TextStyle(color: AppTema.iconColor),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppTema.iconColor),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _signInButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (passwordController.text != reEnterPassController.text) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Las contraseñas no coinciden'),
            ),
          );
          return;
        }
        
        debugPrint('Registro exitoso: ${usernameController.text}, ${emailController.text}');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTema.buttonColor,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Registrarse",
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
