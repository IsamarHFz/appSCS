import 'package:app_scs/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container (
      child: Text(
            "Bienvenido al Sistema de Comercialización SCS", 
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 40.0,
              color: AppTheme.textColor,
            ),
      ),
        decoration: AppTheme.foundColor,
    );
  }
}