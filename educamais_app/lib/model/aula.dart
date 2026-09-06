import 'tipo_aula.dart';

/// Uma aula dentro de um modulo de curso.
class Aula {
  final String titulo;
  final int duracaoMinutos;
  final TipoAula tipo;
  final bool concluida;

  const Aula({
    required this.titulo,
    required this.duracaoMinutos,
    required this.tipo,
    required this.concluida,
  });

  String get duracaoFormatada {
    final horas = duracaoMinutos ~/ 60;
    final minutosRestantes = duracaoMinutos % 60;
    if (horas == 0) {
      return '$duracaoMinutos min';
    }
    if (minutosRestantes == 0) {
      return '${horas}h';
    }
    return '${horas}h${minutosRestantes}min';
  }
}
