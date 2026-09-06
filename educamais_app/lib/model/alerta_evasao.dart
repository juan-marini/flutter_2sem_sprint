import 'risco_evasao.dart';

/// Um alerta preditivo de risco de evasao, sempre acompanhado de uma
/// acao sugerida para o colaborador ou para o gestor.
class AlertaEvasao {
  final String titulo;
  final String descricao;
  final String cursoRelacionado;
  final String acaoSugerida;
  final RiscoEvasao nivel;
  final int probabilidade;

  const AlertaEvasao({
    required this.titulo,
    required this.descricao,
    required this.cursoRelacionado,
    required this.acaoSugerida,
    required this.nivel,
    required this.probabilidade,
  });
}
