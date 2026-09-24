import 'package:flutter/material.dart';

void main() {
<<<<<<< HEAD
      runApp(const MyApp());
}

const kFondo = Color(0xFFFFFFFF);

const kSuperficie = Color(0xFFF7F7F8);

const kBorde = Color(0xFFE7E7EA);

const kTexto = Color(0xFF17181A);

const kMuted = Color(0xFF5F6368);

const kLima = Color(0xFFC8F54E);

const kIconoFondo = Color(0xFFEFF4FF);

class MyApp extends StatelessWidget {

    const MyApp({super.key});

    @override
  Widget build(BuildContext context) {

            return MaterialApp(

                  debugShowCheckedModeBanner: false,

            title: 'Neobank',

      theme: ThemeData(

                brightness: Brightness.light,

                scaffoldBackgroundColor: kFondo,

                colorScheme: const ColorScheme.light(
          primary: kLima,
          surface: kSuperficie,
        ),

                fontFamily: 'Roboto',
      ),

      home: Scaffold(

                backgroundColor: kFondo,

        body: SafeArea(

                              child: ListView(

                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),

                        children: [

              const Center(
                child: Text(
                  'Profile',

                  style: TextStyle(
                    color: kTexto,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: Stack(

                clipBehavior: Clip.none,

                  children: [

                                        CircleAvatar(
                      radius: 46,
                      backgroundColor: kSuperficie,
                      child: Icon(
                        Icons.person,
                        size: 46,
                        color: kMuted,
                      ),
                    ),

                                        Positioned(
                      bottom: -2,
                      right: -2,
                      child: Container(
                        padding: const EdgeInsets.all(6),

                        decoration: BoxDecoration(
                          color: kTexto,
                          shape: BoxShape.circle,

                          border: Border.all(
                            color: kFondo,
                            width: 2,
                          ),
                        ),

                        child: const Icon(
                          Icons.edit,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              tituloSeccion('Personal info'),

              const SizedBox(height: 10),

              Container(

                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 4,
                ),

                decoration: BoxDecoration(
                  color: kSuperficie,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: kBorde),
                ),

                child: Column(
                  children: [

                    filaInfo(
                      Icons.person_outline,
                      'Nombre',
                      'Marco Bolaños',
                    ),

                    divisorFila(),

                    filaInfo(
                      Icons.mail_outline,
                      'E-mail',
                      'marco@gmail.com',
                    ),

                    divisorFila(),

                    filaInfo(
                      Icons.call_outlined,
                      'Numero de telefono',
                      '+502 4258-9863',
                    ),

                    divisorFila(),

                    filaInfo(
                      Icons.home_outlined,
                      'Direccion',
                      'Santa Cruz del Quiche',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              tituloSeccion('Info de cuenta'),

              const SizedBox(height: 10),

              Container(

                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 4,
                ),

                decoration: BoxDecoration(
                  color: kSuperficie,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: kBorde),
                ),

                child: Column(
                  children: [

                    filaInfo(
                      Icons.badge_outlined,
                      'Numero de cuenta',
                      '3625 8225 1401',
                    ),

                    divisorFila(),

                    filaInfo(
                      Icons.shield_outlined,
                      'Tipo de Cuenta',
                      'Personal',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),

         bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,

          type: BottomNavigationBarType.fixed,
          backgroundColor: kFondo,
          selectedItemColor: kTexto,
          unselectedItemColor: kMuted,
          items: const [

            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'Mapa',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.sync_alt),
              label: 'Transferencia',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'Ajustes',
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 34,
                color: kLima,
              ),
              label: 'Perfil',
            ),
          ],
        ),
=======
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marcador',
      debugShowCheckedModeBanner: false,
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
  String nombreEquipoA = 'Municipal';
  String nombreEquipoB = 'Xelajú';

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
      return Colors.grey[300]!;
    }

    if (equipo == 'A') {
      return puntosEquipoA > puntosEquipoB ? Colors.green[100]! : Colors.grey[300]!;
    } else {
      return puntosEquipoB > puntosEquipoA ? Colors.green[100]! : Colors.grey[300]!;
    }
  }

  Color _obtenerColorTextoEquipo(String equipo) {
    if (puntosEquipoA == puntosEquipoB) {
      return Colors.black;
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
        title: const Text('Marcador'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Column(
        children: [
          // Tarjetas de equipos lado a lado
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TarjetaEquipo(
                    nombre: nombreEquipoA,
                    puntos: puntosEquipoA, // Corregido: antes tenía puntosEquipoB
                    colorFondo: _obtenerColorEquipo('A'),
                    colorTexto: _obtenerColorTextoEquipo('A'),
                    onSumar: _sumarPuntosA,
                    onRestar: _restarPuntosA,
                  ),
                ),
                Expanded(
                  child: TarjetaEquipo(
                    nombre: nombreEquipoB,
                    puntos: puntosEquipoB,
                    colorFondo: _obtenerColorEquipo('B'),
                    colorTexto: _obtenerColorTextoEquipo('B'), // Corregido: colortexto -> colorTexto
                    onSumar: _sumarPuntosB,
                    onRestar: _restarPuntosB,
                  ),
                ),
              ],
            ),
          ),
          // Mensaje de ganador
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              _obtenerMensajeGanador(),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
            ),
          ),
          // Botón reiniciar
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
>>>>>>> 91193cb (Primer commit)
      ),
    );
  }
}

<<<<<<< HEAD
Widget tituloSeccion(String title) {
  return Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: [

      Text(
        title,

        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: kTexto,
        ),
      ),

      const Text(
        'Edit',

        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: kLima,
        ),
      ),
    ],
  );
}

Widget filaInfo(
  IconData icon,
  String label,
  String value,
) {

    return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),

    child: Row(

            crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Container(
          padding: const EdgeInsets.all(8),

          decoration: const BoxDecoration(
            color: kIconoFondo,
            shape: BoxShape.circle,
          ),

          child: Icon(
            icon,
            size: 16,
            color: kLima,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

                            Text(
                label,

                style: const TextStyle(
                  fontSize: 11,
                  color: kMuted,
                ),
              ),

              const SizedBox(height: 2),

                            Text(
                value,

                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: kTexto,
=======
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
          Text(
            nombre,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colorTexto,
            ),
          ),
          Text(
            '$puntos',
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: colorTexto,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: onRestar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  '−1',
                  style: TextStyle(
                    fontSize: 20,
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
                    horizontal: 20,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  '+1',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
>>>>>>> 91193cb (Primer commit)
                ),
              ),
            ],
          ),
<<<<<<< HEAD
        ),
      ],
    ),
  );
}

Widget divisorFila() {
  return const Divider(
    height: 1,
    thickness: 1,
    color: kBorde,
  );
}
=======
        ],
      ),
    );
  }
}
>>>>>>> 91193cb (Primer commit)
