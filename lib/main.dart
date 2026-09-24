import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marcador Deportivo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MarcadorPage(),
    );
  }
}

class MarcadorPage extends StatefulWidget {
  const MarcadorPage({Key? key}) : super(key: key);

  @override
  State<MarcadorPage> createState() => _MarcadorPageState();
}

class _MarcadorPageState extends State<MarcadorPage> {
  int puntosEquipoA = 0;
  int puntosEquipoB = 0;
  String nombreEquipoA = 'Municipa';
  String nombreEquipoB = 'Xelaju';

  void _sumarPuntosA() {
    setState(() {
      puntosEquipoA++;
    });
  }

  void _restarPuntosA() {
    setState(() {
      if (puntosEquipoA > 0) {
        puntosEquipoA--;
      }
    });
  }

  void _sumarPuntosB() {
    setState(() {
      puntosEquipoB++;
    });
  }

  void _restarPuntosB() {
    setState(() {
      if (puntosEquipoB > 0) {
        puntosEquipoB--;
      }
    });
  }

  void _reiniciar() {
    setState(() {
      puntosEquipoA = 0;
      puntosEquipoB = 0;
    });
  }

  String _obtenerMensajeGanador() {
    if (puntosEquipoA > puntosEquipoB) {
      return 'Va ganando $nombreEquipoA';
    } else if (puntosEquipoB > puntosEquipoA) {
      return 'Va ganando $nombreEquipoB';
    } else {
      return 'Empate';
    }
  }

  Color _obtenerColorEquipo(String equipo) {
    if (puntosEquipoA == puntosEquipoB) {
      return Colors.grey[300]!; // Neutro en empate
    }

    if (equipo == 'A') {
      return puntosEquipoA > puntosEquipoB ? Colors.green[100]! : Colors.grey[300]!;
    } else {
      return puntosEquipoB > puntosEquipoA ? Colors.green[100]! : Colors.grey[300]!;
    }
  }

  Color _obtenerColorTextoEquipo(String equipo) {
    if (puntosEquipoA == puntosEquipoB) {
      return Colors.black; // Neutro en empate
    }

    if (equipo == 'A') {
      return puntosEquipoA > puntosEquipoB ? Colors.green : Colors.black;
    } else {
      return puntosEquipoB > puntosEquipoA ? Colors.green : Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marcador Deportivo'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                // EQUIPO A
                Expanded(
                  child: TarjetaEquipo(
                    nombre: nombreEquipoA,
                    puntos: puntosEquipoA,
                    colorFondo: _obtenerColorEquipo('A'),
                    colorTexto: _obtenerColorTextoEquipo('A'),
                    onSumar: _sumarPuntosA,
                    onRestar: _restarPuntosA,
                  ),
                ),
                // EQUIPO B
                Expanded(
                  child: TarjetaEquipo(
                    nombre: nombreEquipoB,
                    puntos: puntosEquipoB,
                    colorFondo: _obtenerColorEquipo('B'),
                    colorTexto: _obtenerColorTextoEquipo('B'),
                    onSumar: _sumarPuntosB,
                    onRestar: _restarPuntosB,
                  ),
                ),
              ],
            ),
          ),
          // MENSAJE DE GANADOR
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text(
              _obtenerMensajeGanador(),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          // BOTÓN REINICIAR
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: ElevatedButton(
              onPressed: _reiniciar,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                backgroundColor: Colors.red[400],
              ),
              child: const Text(
                'Reiniciar',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TarjetaEquipo extends StatelessWidget {
  final String nombre;
  final int puntos;
  final Color colorFondo;
  final Color colorTexto;
  final VoidCallback onSumar;
  final VoidCallback onRestar;

  const TarjetaEquipo({
    Key? key,
    required this.nombre,
    required this.puntos,
    required this.colorFondo,
    required this.colorTexto,
    required this.onSumar,
    required this.onRestar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorFondo,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: colorTexto,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // NOMBRE DEL EQUIPO
          Text(
            nombre,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colorTexto,
            ),
          ),
          // PUNTOS (GRANDE)
          Text(
            '$puntos',
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: colorTexto,
            ),
          ),
          // BOTONES +1 Y -1
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: onRestar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  '−1',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: onSumar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  '+1',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}