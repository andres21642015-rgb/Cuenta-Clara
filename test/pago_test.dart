import 'package:flutter_test/flutter_test.dart';
import 'package:cuenta_clara/models/pago.dart';
import 'package:cuenta_clara/utils/formato.dart';

void main() {
  test('copyWith cambia estado y conserva el mismo identificador', () {
    final original = Pago(
      id: 'abc',
      concepto: 'Internet',
      categoria: CategoriaPago.servicios,
      monto: 110000,
      fechaVencimiento: DateTime(2026, 10, 22),
      pagado: false,
      nota: '',
      responsable: 'Mamá', // tocó agregarlo porque ahora es required****
    );

    final nuevo = original.copyWith(pagado: true);

    expect(nuevo.id, 'abc');
    expect(nuevo.pagado, true);
    expect(original.pagado, false); // Inmutabilidad.
  });

//********************************************************* */
// Prueba nueva del reto: reviso que copyWith sí cambie el responsable
  test('copyWith permite editar el responsable', () {
    final original = Pago(
      id: 'xyz',
      concepto: 'Arriendo',
      categoria: CategoriaPago.vivienda,
      monto: 950000,
      fechaVencimiento: DateTime(2026, 11, 5),
      pagado: false,
      nota: '',
      responsable: 'Papá',
    );

    final editado = original.copyWith(responsable: 'Yo');
     expect(editado.id, 'xyz');          // el id no debe cambiar
    expect(editado.responsable, 'Yo');  // el responsable sí cambió
  });

  test('formatearPesos utiliza separadores de miles', () {
    expect(formatearPesos(1250000), '\$1.250.000');
    expect(formatearPesos(0), '\$0');
  });
}
