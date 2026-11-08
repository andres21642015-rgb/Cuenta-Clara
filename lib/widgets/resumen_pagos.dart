import 'package:flutter/material.dart';

import '../utils/formato.dart';

class ResumenPagos extends StatelessWidget {
  final int totalPendientes;
  final int totalPago;
  final int cantidadVencida;

  const ResumenPagos({
    super.key,
    required this.totalPendientes,
    required this.totalPago,
    required this.cantidadVencida,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          _indicador(
            context,
            'Por pagar',
            formatearPesos(totalPendientes),
            Icons.schedule_outlined,
          ),
          _indicador(
            context,
            'Pagado',
            formatearPesos(totalPago),
            Icons.check_circle_outline,
          ),
          _indicador(
            context,
            'Vencidos',
            '$cantidadVencida',
            Icons.warning_amber_outlined,
          ),
        ],
      ),
    );
  }

  Widget _indicador(
    BuildContext context,
    String titulo,
    String valor,
    IconData icono,
  ) {
    final esquema = Theme.of(context).colorScheme;
    return SizedBox(
      width: 165,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icono, color: esquema.primary),
              const SizedBox(height: 6),
              Text(titulo, style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: 3),
              Text(
                valor,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
