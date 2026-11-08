enum CategoriaPago { vivienda, servicios, transporte, educacion, otros }

extension CategoriaPagoTexto on CategoriaPago {
  String get etiqueta {
    switch (this) {
      case CategoriaPago.vivienda:
        return 'Vivienda';
      case CategoriaPago.servicios:
        return 'Servicios';
      case CategoriaPago.transporte:
        return 'Transporte';
      case CategoriaPago.educacion:
        return 'Educación';
      case CategoriaPago.otros:
        return 'Otros';
    }
  }
}

class Pago {
  final String id;
  final String concepto;
  final CategoriaPago categoria;
  final int monto;
  final DateTime fechaVencimiento;
  final bool pagado;
  final String nota;

  const Pago({
    required this.id,
    required this.concepto,
    required this.categoria,
    required this.monto,
    required this.fechaVencimiento,
    required this.pagado,
    required this.nota,
  });

  //Creamos una versión actualizada sin modificar el objeto anterior
  Pago copyWith({
    String? concepto,
    CategoriaPago? categoria,
    int? monto,
    DateTime? fechaVencimiento,
    bool? pagado,
    String? nota,
  }) {
    return Pago(
      id: id,
      concepto: concepto ?? this.concepto,
      categoria: categoria ?? this.categoria,
      monto: monto ?? this.monto,
      fechaVencimiento: fechaVencimiento ?? this.fechaVencimiento,
      pagado: pagado ?? this.pagado,
      nota: nota ?? this.nota,
    );
  }
}
