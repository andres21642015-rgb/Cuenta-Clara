import '../models/pago.dart';

List<Pago> crearPagosDemostracion() {
  final hoy = DateTime.now();
  DateTime relativo(int dias) => DateTime(hoy.year, hoy.month, hoy.day);

  return [
    Pago(
      id: 'demo-1',
      concepto: 'Internet del hogar',
      categoria: CategoriaPago.servicios,
      monto: 110000,
      fechaVencimiento: relativo(3),
      pagado: false,
      nota: 'Factura mensual',
    ),
    Pago(
      id: 'demo-2',
      concepto: 'Arreindo',
      categoria: CategoriaPago.vivienda,
      monto: 1030000,
      fechaVencimiento: relativo(-2),
      pagado: false,
      nota: 'Revisar antes de pagar',
    ),
    Pago(
      id: 'demo-3',
      concepto: 'Transporte',
      categoria: CategoriaPago.transporte,
      monto: 85000,
      fechaVencimiento: relativo(-1),
      pagado: true,
      nota: '',
    ),
  ];
}