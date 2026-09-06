import '../model/sala_estudo.dart';

/// Todas as Salas de Estudo disponiveis no EducaMais.
List<SalaEstudo> getAllSalas() {
  return const [
    SalaEstudo(
      id: 's1',
      titulo: 'Tira-dúvidas: Boas Práticas de Fabricação',
      cursoRelacionado: 'Boas Práticas de Fabricação (BPF)',
      mediador: 'Renata Salgado — Farmacêutica de Produção',
      horario: 'Hoje, 19h00',
      descricao:
          'Sessão prática para revisar os pontos críticos de contaminação '
          'cruzada e documentação de lotes antes da avaliação do módulo.',
      participantes: 18,
      capacidade: 20,
      aoVivo: true,
    ),
    SalaEstudo(
      id: 's2',
      titulo: 'Como notificar corretamente um evento adverso',
      cursoRelacionado: 'Farmacovigilância na Prática',
      mediador: 'Eduardo Nakamura — Farmacovigilância',
      horario: 'Amanhã, 18h00',
      descricao:
          'Encontro para simular o preenchimento do formulário de '
          'notificação e discutir os prazos regulatórios.',
      participantes: 12,
      capacidade: 15,
      aoVivo: false,
    ),
    SalaEstudo(
      id: 's3',
      titulo: 'LGPD na prática: casos reais da indústria',
      cursoRelacionado: 'LGPD Aplicada à Indústria Farmacêutica',
      mediador: 'Camila Duarte — Compliance',
      horario: 'Quinta, 19h30',
      descricao:
          'Discussão de casos reais de tratamento de dados sensíveis de '
          'pacientes e como aplicar a LGPD no dia a dia.',
      participantes: 25,
      capacidade: 25,
      aoVivo: false,
    ),
    SalaEstudo(
      id: 's4',
      titulo: 'Protocolos de validação passo a passo',
      cursoRelacionado: 'Validação de Processos Produtivos',
      mediador: 'Marcos Vinícius Teles — Engenharia de Processos',
      horario: 'Sexta, 17h00',
      descricao:
          'Revisão guiada de um protocolo de validação real, com foco em '
          'critérios de aceitação e parâmetros críticos.',
      participantes: 9,
      capacidade: 20,
      aoVivo: false,
    ),
    SalaEstudo(
      id: 's5',
      titulo: 'Comunicação assertiva em times multidisciplinares',
      cursoRelacionado: 'Comunicação Assertiva com Times',
      mediador: 'Juliana Prado — Desenvolvimento Humano',
      horario: 'Segunda, 12h30',
      descricao:
          'Roda de conversa sobre como dar feedback direto e respeitoso '
          'em times de produção e qualidade.',
      participantes: 6,
      capacidade: 18,
      aoVivo: false,
    ),
  ];
}
