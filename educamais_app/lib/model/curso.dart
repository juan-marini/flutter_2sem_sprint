import 'aula.dart';
import 'modulo.dart';
import 'risco_evasao.dart';

/// Um curso de treinamento oferecido no EducaMais.
class Curso {
  final String id;
  final String titulo;
  final String categoria;
  final String instrutor;
  final String descricao;
  final int cargaHoraria;
  final double progresso;
  final RiscoEvasao risco;
  final bool obrigatorio;
  final DateTime prazo;
  final List<Modulo> modulos;

  const Curso({
    required this.id,
    required this.titulo,
    required this.categoria,
    required this.instrutor,
    required this.descricao,
    required this.cargaHoraria,
    required this.progresso,
    required this.risco,
    required this.obrigatorio,
    required this.prazo,
    required this.modulos,
  });

  int get percentual => (progresso * 100).round();

  bool get concluido => progresso >= 1;

  bool get naoIniciado => progresso <= 0;

  int get totalAulas =>
      modulos.fold(0, (soma, modulo) => soma + modulo.aulas.length);

  int get aulasConcluidas =>
      modulos.fold(0, (soma, modulo) => soma + modulo.aulasConcluidas);

  /// A proxima aula ainda nao concluida, seguindo a ordem dos modulos.
  /// Retorna nulo quando o curso esta totalmente concluido.
  Aula? get proximaAula {
    for (final modulo in modulos) {
      for (final aula in modulo.aulas) {
        if (!aula.concluida) {
          return aula;
        }
      }
    }
    return null;
  }
}
