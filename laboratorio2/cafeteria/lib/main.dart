import 'package:flutter/material.dart';

void main() {
  runApp(const MiPedidoApp());
}

class MiPedidoApp extends StatelessWidget {
  const MiPedidoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cafetería',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const PantallaMiPedido(),
    );
  }
}

class PantallaMiPedido extends StatefulWidget {
  const PantallaMiPedido({super.key});

  @override
  State<PantallaMiPedido> createState() => _PantallaMiPedidoState();
}

class _PantallaMiPedidoState extends State<PantallaMiPedido> {
  // Cantidades de los tres productos requeridos
  int cantidadCafe = 0;
  int cantidadSandwich = 0;
  int cantidadJugo = 0;

  // Precios unitarios
  final double precioCafe = 10.00;
  final double precioSandwich = 25.00;
  final double precioJugo = 12.00;

  // Cálculo dinámico del total
  double get totalPedido {
    return (cantidadCafe * precioCafe) +
        (cantidadSandwich * precioSandwich) +
        (cantidadJugo * precioJugo);
  }

  // Restablece todas las cantidades a cero
  void _vaciarPedido() {
    setState(() {
      cantidadCafe = 0;
      cantidadSandwich = 0;
      cantidadJugo = 0;
    });
  }

 
}