import '../model/alerta_evasao.dart';
import '../model/risco_evasao.dart';

/// Alertas preditivos de risco de evasao gerados para o colaborador logado.
List<AlertaEvasao> getAllAlertas() {
  return const [
    AlertaEvasao(
      titulo: 'Risco de abandono em LGPD Aplicada à Indústria Farmacêutica',
      descricao:
          'Você acessou o curso apenas duas vezes nas últimas três '
          'semanas e o prazo está próximo.',
      cursoRelacionado: 'LGPD Aplicada à Indústria Farmacêutica',
      acaoSugerida:
          'Reserve 20 minutos hoje para concluir o Módulo 1 e retomar '
          'o ritmo antes do prazo.',
      nivel: RiscoEvasao.alto,
      probabilidade: 78,
    ),
    AlertaEvasao(
      titulo:
          'Ritmo abaixo do esperado em Segurança do Trabalho em Ambiente '
          'Fabril',
      descricao:
          'Seu ritmo de estudo caiu 40% em relação à média do seu setor '
          'nas últimas duas semanas.',
      cursoRelacionado: 'Segurança do Trabalho em Ambiente Fabril',
      acaoSugerida:
          'Participe da próxima Sala de Estudo do curso para tirar '
          'dúvidas e retomar o embalo.',
      nivel: RiscoEvasao.medio,
      probabilidade: 45,
    ),
  ];
}
