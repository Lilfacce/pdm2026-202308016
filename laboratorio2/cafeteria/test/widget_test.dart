import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cafeteria/main.dart';

/// Indices de las filas: 0 = Café, 1 = Sándwich, 2 = Jugo
const _filas = ['filaCafe', 'filaSandwich', 'filaJugo'];

Finder _fila(int i) => find.byKey(Key(_filas[i]));

Finder _boton(int i, IconData icono) => find.descendant(
  of: _fila(i),
  matching: find.widgetWithIcon(IconButton, icono),
);

String _total(WidgetTester tester) =>
    tester.widget<Text>(find.byKey(const Key('totalPedido'))).data!;

bool _menosHabilitado(WidgetTester tester, int i) =>
    tester.widget<IconButton>(_boton(i, Icons.remove)).onPressed != null;

Future<void> _pulsar(WidgetTester tester, int i, IconData icono) async {
  await tester.tap(_boton(i, icono));
  await tester.pump();
}

Future<void> _vaciar(WidgetTester tester) async {
  await tester.tap(find.widgetWithText(ElevatedButton, 'Vaciar pedido'));
  await tester.pump();
}

void main() {
  testWidgets('La pantalla se titula "Mi pedido"', (WidgetTester tester) async {
    await tester.pumpWidget(const MiPedidoApp());

    expect(find.widgetWithText(AppBar, 'Mi pedido'), findsOneWidget);
  });

  testWidgets('Muestra los 3 productos con su precio y cantidad cero',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MiPedidoApp());

    expect(find.byType(ProductoPedido), findsNWidgets(3));
    expect(find.text('Café'), findsOneWidget);
    expect(find.text('Sándwich'), findsOneWidget);
    expect(find.text('Jugo'), findsOneWidget);
    expect(find.text('Q10.00'), findsOneWidget);
    expect(find.text('Q25.00'), findsOneWidget);
    expect(find.text('Q12.00'), findsOneWidget);
    expect(find.text('0'), findsNWidgets(3));
    expect(_total(tester), 'Q0.00');
  });

  testWidgets('El botón -1 inicia deshabilitado en cantidad cero',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MiPedidoApp());

    for (var i = 0; i < 3; i++) {
      expect(_menosHabilitado(tester, i), isFalse, reason: 'fila $i');
    }
  });

  testWidgets('+1 incrementa la cantidad y actualiza el total',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MiPedidoApp());

    await _pulsar(tester, 0, Icons.add);
    expect(_total(tester), 'Q10.00');

    await _pulsar(tester, 0, Icons.add);
    await _pulsar(tester, 1, Icons.add);
    await _pulsar(tester, 2, Icons.add);

    // 2 x Q10.00 + 1 x Q25.00 + 1 x Q12.00 = Q57.00
    expect(_total(tester), 'Q57.00');
  });

  testWidgets('-1 descuenta y el total se recalcula',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MiPedidoApp());

    await _pulsar(tester, 1, Icons.add);
    await _pulsar(tester, 1, Icons.add);
    expect(_total(tester), 'Q50.00');

    await _pulsar(tester, 1, Icons.remove);
    expect(_total(tester), 'Q25.00');

    await _pulsar(tester, 1, Icons.remove);
    expect(_total(tester), 'Q0.00');
  });

  testWidgets('No permite cantidades negativas y el producto sigue visible',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MiPedidoApp());

    for (var i = 0; i < 3; i++) {
      await _pulsar(tester, i, Icons.remove);
    }

    expect(find.text('0'), findsNWidgets(3));
    expect(_total(tester), 'Q0.00');
    expect(find.byType(ProductoPedido), findsNWidgets(3));
    expect(find.text('Café'), findsOneWidget);
    expect(find.text('Sándwich'), findsOneWidget);
    expect(find.text('Jugo'), findsOneWidget);
  });

  testWidgets('"Vaciar pedido" restablece cantidades y total a cero',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MiPedidoApp());

    await _pulsar(tester, 0, Icons.add);
    await _pulsar(tester, 1, Icons.add);
    await _pulsar(tester, 2, Icons.add);
    await _pulsar(tester, 2, Icons.add);
    // Q10.00 + Q25.00 + 2 x Q12.00 = Q59.00
    expect(_total(tester), 'Q59.00');

    await _vaciar(tester);

    expect(find.text('0'), findsNWidgets(3));
    expect(_total(tester), 'Q0.00');
    expect(find.byType(ProductoPedido), findsNWidgets(3));

    for (var i = 0; i < 3; i++) {
      expect(_menosHabilitado(tester, i), isFalse, reason: 'fila $i');
    }
  });

  testWidgets('El total se muestra con dos decimales',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MiPedidoApp());

    await _pulsar(tester, 2, Icons.add);
    expect(_total(tester), 'Q12.00');

    await _pulsar(tester, 2, Icons.add);
    await _pulsar(tester, 2, Icons.add);
    expect(_total(tester), 'Q36.00');
    expect(find.text('Q36'), findsNothing);
  });

  testWidgets('Las filas son independientes entre sí',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MiPedidoApp());

    await _pulsar(tester, 0, Icons.add);
    await _pulsar(tester, 0, Icons.add);
    await _pulsar(tester, 0, Icons.add);

    final cantidades = tester
        .widgetList<ProductoPedido>(find.byType(ProductoPedido))
        .map((p) => p.cantidad)
        .toList();

    expect(cantidades, [3, 0, 0]);
    expect(_total(tester), 'Q30.00');
  });

  testWidgets('ProductoPedido recibe datos y acciones como parámetros',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MiPedidoApp());

    final filas = tester
        .widgetList<ProductoPedido>(find.byType(ProductoPedido))
        .toList();

    expect(filas[0].nombre, 'Café');
    expect(filas[0].precioUnitario, 10.00);
    expect(filas[1].nombre, 'Sándwich');
    expect(filas[1].precioUnitario, 25.00);
    expect(filas[2].nombre, 'Jugo');
    expect(filas[2].precioUnitario, 12.00);

    for (final fila in filas) {
      expect(fila.cantidad, 0);
      expect(fila.onIncrementar, isNotNull);
      expect(fila.onDecrementar, isNotNull);
    }
  });
}