import '../model/mensagem_edia.dart';

/// Sugestoes de pergunta mostradas em chips antes da primeira mensagem
/// do usuario no chat da EdIA.
List<String> getSugestoesPerguntas() {
  return const [
    'O que é contaminação cruzada em BPF?',
    'Como notificar um evento adverso?',
    'Quais dados a LGPD protege?',
    'O que é um protocolo de validação?',
    'Qual é o meu progresso nos cursos?',
    'Como funcionam as Salas de Estudo?',
  ];
}

/// Responde a pergunta do colaborador buscando por palavra-chave no
/// material dos cursos (RAG simplificado para o MVP).
///
/// Regra de zero alucinação: toda resposta baseada no material sempre
/// mostra a fonte exata (curso, módulo e aula). Perguntas sobre o uso do
/// proprio aplicativo (progresso, salas) sao respondidas sem citar o
/// material, porque nao vem dele. Quando nenhuma palavra-chave conhecida
/// e encontrada, a EdIA prefere nao responder a arriscar uma informacao
/// sem base.
MensagemEdia responder(String pergunta) {
  final texto = pergunta.toLowerCase();

  if (texto.contains('bpf') || texto.contains('contamina')) {
    return MensagemEdia.daEdia(
      'De acordo com o material de Boas Práticas de Fabricação, a '
      'contaminação cruzada deve ser prevenida com barreiras físicas '
      'entre áreas de manipulação, fluxo unidirecional de pessoas e '
      'materiais, uso de vestimenta específica por área e limpeza '
      'validada entre lotes de produtos diferentes. Ambientes '
      'classificados como áreas limpas exigem controle de pressão '
      'diferencial e monitoramento contínuo de partículas.',
      fonte: 'Boas Práticas de Fabricação (BPF) > Módulo 1 > Aula 2',
    );
  }

  if (texto.contains('evento adverso') || texto.contains('notific')) {
    return MensagemEdia.daEdia(
      'Um evento adverso deve ser notificado à área de Farmacovigilância '
      'em até 24 horas após o conhecimento do caso, preenchendo o '
      'formulário de notificação com dados do paciente, do produto e da '
      'reação observada. Casos graves ou inesperados têm prazo '
      'regulatório de notificação à ANVISA e exigem acompanhamento até '
      'o desfecho.',
      fonte: 'Farmacovigilância na Prática > Módulo 2 > Aula 1',
    );
  }

  if (texto.contains('lgpd')) {
    return MensagemEdia.daEdia(
      'A LGPD exige que dados pessoais de pacientes e colaboradores só '
      'sejam tratados com uma base legal definida, como consentimento '
      'ou execução de contrato. Na indústria farmacêutica, dados de '
      'saúde são considerados sensíveis e demandam camadas adicionais '
      'de proteção, controle de acesso e registro de todas as '
      'operações de tratamento.',
      fonte: 'LGPD Aplicada à Indústria Farmacêutica > Módulo 1 > Aula 1',
    );
  }

  if (texto.contains('valida') || texto.contains('protocolo')) {
    return MensagemEdia.daEdia(
      'Um protocolo de validação de processo deve definir previamente '
      'os critérios de aceitação, os parâmetros críticos monitorados e '
      'o número de lotes consecutivos necessários para comprovar que o '
      'processo é reprodutível. Qualquer desvio do protocolo durante a '
      'execução precisa ser registrado e avaliado antes da conclusão '
      'do relatório final.',
      fonte: 'Validação de Processos Produtivos > Módulo 1 > Aula 2',
    );
  }

  if (texto.contains('progresso')) {
    return MensagemEdia.daEdia(
      'Você acompanha seu progresso em tempo real na aba Início, no '
      'cartão de indicadores, e também na aba Perfil, na barra de XP e '
      'na lista de cursos concluídos. Essa informação vem do seu uso do '
      'aplicativo, não do material dos cursos, por isso não cito uma '
      'fonte aqui.',
    );
  }

  if (texto.contains('sala')) {
    return MensagemEdia.daEdia(
      'As Salas de Estudo são encontros síncronos e curtos, mediados '
      'por colegas que já dominam o conteúdo. Você encontra os '
      'horários, a lotação e o curso relacionado de cada sala na aba '
      'Salas. Essa informação é sobre o funcionamento do aplicativo, '
      'não do material dos cursos, por isso não cito uma fonte aqui.',
    );
  }

  return MensagemEdia.daEdia(
    'Não encontrei essa informação no material disponível. Para não '
    'te dar uma resposta incorreta, prefiro não responder — procure o '
    'conteúdo na aba Cursos ou pergunte de outra forma.',
  );
}
