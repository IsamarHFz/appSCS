import 'package:app_scs/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

@override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

// import 'package:app_scs/screens/ticket_screen.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MainApp());
// }

// // Variables globales
// double altura = 0.1;
// double tamanio = 0.1;
// int ids = 0;

// double convertir([String valor = '0.1']) {
//   try {
//     double convertidor = double.parse(valor);
//     print("$convertidor en su proceso de com");
//     return convertidor;
//   } catch (e) {
//     print("No se pudo convertir. Error: $e");
//     return 0.0;
//   }
// }

// int convertirInt([String valor = '0.1']) {
//   try {
//     int convertidor = int.parse(valor);
//     print("$convertidor en su proceso de com");
//     return convertidor;
//   } catch (e) {
//     print("No se pudo convertir. Error: $e");
//     return 0;
//   }
// }

// class MainApp extends StatefulWidget {
//   const MainApp({Key? key}) : super(key: key);
//   @override
//   State<MainApp> createState() => _MainAppState();
// }

// class _MainAppState extends State<MainApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: TicketDigital(
//         nombreCliente: "Juan Pérez",
//         gradoyGrupo: "3°B",
//         numeroTelefono: "1234567890",
//         items: const [
//           {"nombre": "sudadera", "precio": 300.0, "total": 300.0},
//         ],
//         subtotal: 300.0,
//         total: 300.0,
//         totalPagado: 300.0,
//         metodoPago: "Efectivo",
//         fecha: DateTime.now().toIso8601String(),
//       ),
//  // O MenuPrincipal() si prefieres
//     );
//   }
// }
