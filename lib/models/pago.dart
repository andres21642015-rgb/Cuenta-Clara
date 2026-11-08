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

  // Agregué este campo para saber quién de la casa tiene que pagar la factura**
  final String responsable;


  const Pago({
    required this.id,
    required this.concepto,
    required this.categoria,
    required this.monto,
    required this.fechaVencimiento,
    required this.pagado,
    required this.nota,

    // lo puse required para que todo pago tenga responsable**
    required this.responsable,
  });

 
  Pago copyWith({
    String? concepto,
    CategoriaPago? categoria,
    int? monto,
    DateTime? fechaVencimiento,
    bool? pagado,
    String? nota,
    String? responsable, // nuevo: opcional por si solo quiero cambiar otra cosa**

  }) {
    return Pago(
      id: id,
      concepto: concepto ?? this.concepto,
      categoria: categoria ?? this.categoria,
      monto: monto ?? this.monto,
      fechaVencimiento: fechaVencimiento ?? this.fechaVencimiento,
      pagado: pagado ?? this.pagado,
      nota: nota ?? this.nota,
       // si no mando responsable, se queda el que ya tenía el pago**
      responsable: responsable ?? this.responsable,
    );
  }
}
