/// Um encontro sincrono e curto de uma Sala de Estudo, mediado por quem
/// ja domina o conteudo.
class SalaEstudo {
  final String id;
  final String titulo;
  final String cursoRelacionado;
  final String mediador;
  final String horario;
  final String descricao;
  final int participantes;
  final int capacidade;
  final bool aoVivo;

  const SalaEstudo({
    required this.id,
    required this.titulo,
    required this.cursoRelacionado,
    required this.mediador,
    required this.horario,
    required this.descricao,
    required this.participantes,
    required this.capacidade,
    required this.aoVivo,
  });

  bool get lotada => participantes >= capacidade;

  int get vagasRestantes => (capacidade - participantes).clamp(0, capacidade);

  double get ocupacao => capacidade == 0 ? 0 : participantes / capacidade;
}
