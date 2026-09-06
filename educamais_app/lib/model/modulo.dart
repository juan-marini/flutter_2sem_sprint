import 'aula.dart';

/// Um modulo de curso, composto por uma sequencia de aulas.
class Modulo {
  final String titulo;
  final List<Aula> aulas;

  const Modulo({required this.titulo, required this.aulas});

  int get aulasConcluidas => aulas.where((aula) => aula.concluida).length;

  double get progresso => aulas.isEmpty ? 0 : aulasConcluidas / aulas.length;

  bool get concluido => aulas.isNotEmpty && aulasConcluidas == aulas.length;

  int get duracaoMinutos =>
      aulas.fold(0, (soma, aula) => soma + aula.duracaoMinutos);
}
