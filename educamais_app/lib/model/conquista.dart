import 'tipo_conquista.dart';

/// Uma conquista desbloqueavel na trilha de estudos do colaborador.
class Conquista {
  final String titulo;
  final String descricao;
  final TipoConquista tipo;
  final bool desbloqueada;

  const Conquista({
    required this.titulo,
    required this.descricao,
    required this.tipo,
    required this.desbloqueada,
  });
}
