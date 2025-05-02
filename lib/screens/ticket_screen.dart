import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 

class TicketDigital extends StatelessWidget {
  final String nombreCliente;
  final String gradoyGrupo;
  final String numeroTelefono;
  final List<Map<String, dynamic>> items;
  final double subtotal;
  final double total;
  final double totalPagado;
  final String metodoPago;
  final String fecha;

  const TicketDigital({
    Key? key,
    required this.nombreCliente,
    required this.gradoyGrupo,
    required this.numeroTelefono,
    required this.items,
    required this.subtotal,
    required this.total,
    required this.totalPagado,
    required this.metodoPago,
    required this.fecha,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy'); // ✅ Línea 29 corregida

    return Scaffold(
      appBar: AppBar(title: const Text('Ticket Digital Eco_Friendly')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Eco-Friendly', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Text('M. Hidalgo'),
              const Text('90460 Xaloztoc, Tlaxcala'),
              const Text('México'),
              const SizedBox(height: 16),
              const Text('Detalles del cliente', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Nombre del cliente: $nombreCliente'),
              Text('Grado y Grupo: $gradoyGrupo'),
              Text('Número de teléfono: $numeroTelefono'),
              const SizedBox(height: 16),
              const Text('Items', style: TextStyle(fontWeight: FontWeight.bold)),
              DataTable(
                columns: const [
                  DataColumn(label: Text('Nombre')),
                  DataColumn(label: Text('Precio')),
                  DataColumn(label: Text('Total')),
                ],
                rows: items.map((item) => DataRow(
                  cells: [
                    DataCell(Text(item['nombre'])),
                    DataCell(Text('\$${(item['precio'] as double).toStringAsFixed(2)}')),
                    DataCell(Text('\$${(item['total'] as double).toStringAsFixed(2)}')),
                  ],
                )).toList(),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Subtotal', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('\$${subtotal.toStringAsFixed(2)}'), // ✅ Línea 59 corregida
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('\$${total.toStringAsFixed(2)}'), // ✅ Línea 60 corregida
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Pagado', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('\$${totalPagado.toStringAsFixed(2)}'),
                ],
              ),
              const SizedBox(height: 16),
              Text('Detalles del pago: ${dateFormat.format(DateTime.parse(fecha))} - $metodoPago'),
              const SizedBox(height: 16),
              const Text('¡Gracias por su compra!'),
            ],
          ),
        ),
      ),
    );
  }
}
