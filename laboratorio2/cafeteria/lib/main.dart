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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi pedido'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Reutilización del widget ProductoPedido para las 3 filas
            ProductoPedido(
              key: const Key('filaCafe'),
              nombre: 'Café',
              precioUnitario: precioCafe,
              cantidad: cantidadCafe,
              onIncrementar: () {
                setState(() {
                  cantidadCafe++;
                });
              },
              onDecrementar: () {
                if (cantidadCafe > 0) {
                  setState(() {
                    cantidadCafe--;
                  });
                }
              },
            ),
            const Divider(),
            ProductoPedido(
              key: const Key('filaSandwich'),
              nombre: 'Sándwich',
              precioUnitario: precioSandwich,
              cantidad: cantidadSandwich,
              onIncrementar: () {
                setState(() {
                  cantidadSandwich++;
                });
              },
              onDecrementar: () {
                if (cantidadSandwich > 0) {
                  setState(() {
                    cantidadSandwich--;
                  });
                }
              },
            ),
            const Divider(),
            ProductoPedido(
              key: const Key('filaJugo'),
              nombre: 'Jugo',
              precioUnitario: precioJugo,
              cantidad: cantidadJugo,
              onIncrementar: () {
                setState(() {
                  cantidadJugo++;
                });
              },
              onDecrementar: () {
                if (cantidadJugo > 0) {
                  setState(() {
                    cantidadJugo--;
                  });
                }
              },
            ),
            const Spacer(),
            // Sección inferior con el total y el botón para vaciar
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Q${totalPedido.toStringAsFixed(2)}',
                          key: const Key('totalPedido'),
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: _vaciarPedido,
                        child: const Text(
                          'Vaciar pedido',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget reutilizable para mostrar cada fila de producto
class ProductoPedido extends StatelessWidget {
  final String nombre;
  final double precioUnitario;
  final int cantidad;
  final VoidCallback onIncrementar;
  final VoidCallback onDecrementar;

  const ProductoPedido({
    super.key,
    required this.nombre,
    required this.precioUnitario,
    required this.cantidad,
    required this.onIncrementar,
    required this.onDecrementar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Nombre y precio unitario
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nombre,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Q${precioUnitario.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          // Controles -1 / cantidad / +1
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: cantidad > 0 ? onDecrementar : null,
                  iconSize: 20,
                  constraints: const BoxConstraints(
                    minWidth: 36,
                    minHeight: 36,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '$cantidad',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: onIncrementar,
                  iconSize: 20,
                  constraints: const BoxConstraints(
                    minWidth: 36,
                    minHeight: 36,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
