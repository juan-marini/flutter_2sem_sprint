import '../model/aula.dart';
import '../model/curso.dart';
import '../model/modulo.dart';
import '../model/risco_evasao.dart';
import '../model/tipo_aula.dart';

/// Todos os cursos de treinamento disponiveis no EducaMais.
List<Curso> getAllCursos() {
  return [
    Curso(
      id: 'bpf',
      titulo: 'Boas Práticas de Fabricação (BPF)',
      categoria: 'Qualidade',
      instrutor: 'Renata Salgado',
      descricao:
          'Fundamentos e boas práticas para garantir a qualidade e a '
          'segurança na fabricação de medicamentos.',
      cargaHoraria: 8,
      progresso: 4 / 6,
      risco: RiscoEvasao.medio,
      obrigatorio: true,
      prazo: DateTime(2026, 9, 25),
      modulos: const [
        Modulo(
          titulo: 'Fundamentos de BPF',
          aulas: [
            Aula(
              titulo: 'Introdução às Boas Práticas de Fabricação',
              duracaoMinutos: 18,
              tipo: TipoAula.video,
              concluida: true,
            ),
            Aula(
              titulo: 'Contaminação cruzada e controle de áreas limpas',
              duracaoMinutos: 22,
              tipo: TipoAula.video,
              concluida: true,
            ),
            Aula(
              titulo: 'Documentação e rastreabilidade de lotes',
              duracaoMinutos: 15,
              tipo: TipoAula.leitura,
              concluida: true,
            ),
          ],
        ),
        Modulo(
          titulo: 'Controle de Qualidade na Produção',
          aulas: [
            Aula(
              titulo: 'Amostragem e testes em processo',
              duracaoMinutos: 20,
              tipo: TipoAula.video,
              concluida: true,
            ),
            Aula(
              titulo: 'Desvios e não conformidades',
              duracaoMinutos: 12,
              tipo: TipoAula.leitura,
              concluida: false,
            ),
            Aula(
              titulo: 'Quiz: fundamentos de BPF',
              duracaoMinutos: 10,
              tipo: TipoAula.quiz,
              concluida: false,
            ),
          ],
        ),
      ],
    ),
    Curso(
      id: 'farmacovigilancia',
      titulo: 'Farmacovigilância na Prática',
      categoria: 'Farmacovigilância',
      instrutor: 'Eduardo Nakamura',
      descricao:
          'Como identificar, registrar e notificar eventos adversos '
          'relacionados a medicamentos.',
      cargaHoraria: 6,
      progresso: 1,
      risco: RiscoEvasao.baixo,
      obrigatorio: true,
      prazo: DateTime(2026, 8, 15),
      modulos: const [
        Modulo(
          titulo: 'Fundamentos de Farmacovigilância',
          aulas: [
            Aula(
              titulo: 'O que é um evento adverso',
              duracaoMinutos: 15,
              tipo: TipoAula.video,
              concluida: true,
            ),
            Aula(
              titulo: 'Classificação de reações adversas',
              duracaoMinutos: 14,
              tipo: TipoAula.leitura,
              concluida: true,
            ),
          ],
        ),
        Modulo(
          titulo: 'Notificação e Acompanhamento',
          aulas: [
            Aula(
              titulo: 'Como notificar corretamente um evento adverso',
              duracaoMinutos: 20,
              tipo: TipoAula.video,
              concluida: true,
            ),
            Aula(
              titulo: 'Prazos regulatórios e acompanhamento de casos',
              duracaoMinutos: 16,
              tipo: TipoAula.leitura,
              concluida: true,
            ),
            Aula(
              titulo: 'Quiz: farmacovigilância na prática',
              duracaoMinutos: 8,
              tipo: TipoAula.quiz,
              concluida: true,
            ),
          ],
        ),
      ],
    ),
    Curso(
      id: 'lgpd',
      titulo: 'LGPD Aplicada à Indústria Farmacêutica',
      categoria: 'Compliance',
      instrutor: 'Camila Duarte',
      descricao:
          'Como aplicar a Lei Geral de Proteção de Dados no tratamento de '
          'dados de pacientes e colaboradores.',
      cargaHoraria: 4,
      progresso: 1 / 6,
      risco: RiscoEvasao.alto,
      obrigatorio: true,
      prazo: DateTime(2026, 9, 10),
      modulos: const [
        Modulo(
          titulo: 'Fundamentos da LGPD',
          aulas: [
            Aula(
              titulo:
                  'Dados pessoais e dados sensíveis na indústria '
                  'farmacêutica',
              duracaoMinutos: 16,
              tipo: TipoAula.video,
              concluida: true,
            ),
            Aula(
              titulo: 'Bases legais para tratamento de dados',
              duracaoMinutos: 14,
              tipo: TipoAula.leitura,
              concluida: false,
            ),
            Aula(
              titulo: 'Direitos do titular dos dados',
              duracaoMinutos: 12,
              tipo: TipoAula.video,
              concluida: false,
            ),
          ],
        ),
        Modulo(
          titulo: 'LGPD no Dia a Dia',
          aulas: [
            Aula(
              titulo: 'Consentimento e uso de dados de pacientes',
              duracaoMinutos: 18,
              tipo: TipoAula.video,
              concluida: false,
            ),
            Aula(
              titulo: 'Incidentes de segurança e resposta a vazamentos',
              duracaoMinutos: 15,
              tipo: TipoAula.leitura,
              concluida: false,
            ),
            Aula(
              titulo: 'Quiz: LGPD aplicada à indústria farmacêutica',
              duracaoMinutos: 10,
              tipo: TipoAula.quiz,
              concluida: false,
            ),
          ],
        ),
      ],
    ),
    Curso(
      id: 'seguranca-trabalho',
      titulo: 'Segurança do Trabalho em Ambiente Fabril',
      categoria: 'Segurança do Trabalho',
      instrutor: 'Paulo Renato Almeida',
      descricao:
          'Práticas de prevenção de acidentes e uso correto de '
          'equipamentos de proteção em ambiente fabril.',
      cargaHoraria: 10,
      progresso: 3 / 6,
      risco: RiscoEvasao.medio,
      obrigatorio: true,
      prazo: DateTime(2026, 10, 10),
      modulos: const [
        Modulo(
          titulo: 'Prevenção de Acidentes',
          aulas: [
            Aula(
              titulo: 'Identificação de riscos no chão de fábrica',
              duracaoMinutos: 20,
              tipo: TipoAula.video,
              concluida: true,
            ),
            Aula(
              titulo: 'Uso correto de EPIs',
              duracaoMinutos: 18,
              tipo: TipoAula.video,
              concluida: true,
            ),
            Aula(
              titulo: 'Sinalização e áreas de circulação segura',
              duracaoMinutos: 12,
              tipo: TipoAula.leitura,
              concluida: true,
            ),
          ],
        ),
        Modulo(
          titulo: 'Resposta a Emergências',
          aulas: [
            Aula(
              titulo: 'Procedimentos em caso de vazamento químico',
              duracaoMinutos: 22,
              tipo: TipoAula.video,
              concluida: false,
            ),
            Aula(
              titulo: 'Primeiros socorros no ambiente fabril',
              duracaoMinutos: 16,
              tipo: TipoAula.leitura,
              concluida: false,
            ),
            Aula(
              titulo: 'Quiz: segurança do trabalho em ambiente fabril',
              duracaoMinutos: 10,
              tipo: TipoAula.quiz,
              concluida: false,
            ),
          ],
        ),
      ],
    ),
    Curso(
      id: 'validacao-processos',
      titulo: 'Validação de Processos Produtivos',
      categoria: 'Qualidade',
      instrutor: 'Marcos Vinícius Teles',
      descricao:
          'Como planejar, executar e documentar a validação de processos '
          'produtivos críticos.',
      cargaHoraria: 12,
      progresso: 0,
      risco: RiscoEvasao.baixo,
      obrigatorio: true,
      prazo: DateTime(2026, 11, 20),
      modulos: const [
        Modulo(
          titulo: 'Planejamento da Validação',
          aulas: [
            Aula(
              titulo: 'Introdução à validação de processos',
              duracaoMinutos: 20,
              tipo: TipoAula.video,
              concluida: false,
            ),
            Aula(
              titulo:
                  'Protocolos de validação: estrutura e critérios de '
                  'aceitação',
              duracaoMinutos: 18,
              tipo: TipoAula.leitura,
              concluida: false,
            ),
            Aula(
              titulo: 'Parâmetros críticos de processo',
              duracaoMinutos: 16,
              tipo: TipoAula.video,
              concluida: false,
            ),
          ],
        ),
        Modulo(
          titulo: 'Execução e Relatório',
          aulas: [
            Aula(
              titulo: 'Execução de lotes de validação',
              duracaoMinutos: 24,
              tipo: TipoAula.video,
              concluida: false,
            ),
            Aula(
              titulo: 'Tratamento de desvios durante a validação',
              duracaoMinutos: 14,
              tipo: TipoAula.leitura,
              concluida: false,
            ),
            Aula(
              titulo: 'Quiz: validação de processos produtivos',
              duracaoMinutos: 10,
              tipo: TipoAula.quiz,
              concluida: false,
            ),
          ],
        ),
      ],
    ),
    Curso(
      id: 'comunicacao-assertiva',
      titulo: 'Comunicação Assertiva com Times',
      categoria: 'Comportamental',
      instrutor: 'Juliana Prado',
      descricao:
          'Técnicas de comunicação clara e feedback respeitoso para times '
          'multidisciplinares.',
      cargaHoraria: 5,
      progresso: 2 / 5,
      risco: RiscoEvasao.baixo,
      obrigatorio: false,
      prazo: DateTime(2026, 10, 31),
      modulos: const [
        Modulo(
          titulo: 'Fundamentos da Comunicação Assertiva',
          aulas: [
            Aula(
              titulo: 'O que é comunicação assertiva',
              duracaoMinutos: 14,
              tipo: TipoAula.video,
              concluida: true,
            ),
            Aula(
              titulo: 'Escuta ativa e empatia',
              duracaoMinutos: 12,
              tipo: TipoAula.leitura,
              concluida: true,
            ),
            Aula(
              titulo: 'Aula ao vivo: praticando feedback em grupo',
              duracaoMinutos: 30,
              tipo: TipoAula.aoVivo,
              concluida: false,
            ),
          ],
        ),
        Modulo(
          titulo: 'Aplicando no Dia a Dia',
          aulas: [
            Aula(
              titulo: 'Feedback direto sem gerar conflito',
              duracaoMinutos: 16,
              tipo: TipoAula.video,
              concluida: false,
            ),
            Aula(
              titulo: 'Quiz: comunicação assertiva com times',
              duracaoMinutos: 8,
              tipo: TipoAula.quiz,
              concluida: false,
            ),
          ],
        ),
      ],
    ),
    Curso(
      id: 'compliance-codigo-conduta',
      titulo: 'Compliance e Código de Conduta',
      categoria: 'Compliance',
      instrutor: 'Camila Duarte',
      descricao:
          'Princípios do Código de Conduta e prevenção a práticas '
          'antiéticas na relação com médicos e clientes.',
      cargaHoraria: 6,
      progresso: 4 / 5,
      risco: RiscoEvasao.baixo,
      obrigatorio: true,
      prazo: DateTime(2026, 9, 30),
      modulos: const [
        Modulo(
          titulo: 'Princípios do Código de Conduta',
          aulas: [
            Aula(
              titulo: 'Conflitos de interesse e relacionamento com médicos',
              duracaoMinutos: 16,
              tipo: TipoAula.video,
              concluida: true,
            ),
            Aula(
              titulo: 'Brindes, presentes e hospitalidade',
              duracaoMinutos: 10,
              tipo: TipoAula.leitura,
              concluida: true,
            ),
            Aula(
              titulo: 'Canal de denúncias e retaliação zero',
              duracaoMinutos: 14,
              tipo: TipoAula.video,
              concluida: true,
            ),
          ],
        ),
        Modulo(
          titulo: 'Compliance na Prática',
          aulas: [
            Aula(
              titulo: 'Estudo de caso: prática comercial antiética',
              duracaoMinutos: 18,
              tipo: TipoAula.video,
              concluida: true,
            ),
            Aula(
              titulo: 'Quiz: compliance e código de conduta',
              duracaoMinutos: 10,
              tipo: TipoAula.quiz,
              concluida: false,
            ),
          ],
        ),
      ],
    ),
    Curso(
      id: 'excel-avancado',
      titulo: 'Excel Avançado para Análise de Dados',
      categoria: 'Dados',
      instrutor: 'Bruno Kazuo Ishida',
      descricao:
          'Recursos avançados de planilhas para consolidar e analisar '
          'indicadores de produção e qualidade.',
      cargaHoraria: 8,
      progresso: 1 / 7,
      risco: RiscoEvasao.baixo,
      obrigatorio: false,
      prazo: DateTime(2026, 12, 5),
      modulos: const [
        Modulo(
          titulo: 'Fórmulas e Funções Avançadas',
          aulas: [
            Aula(
              titulo: 'Funções PROCV, ÍNDICE e CORRESP',
              duracaoMinutos: 20,
              tipo: TipoAula.video,
              concluida: true,
            ),
            Aula(
              titulo: 'Fórmulas condicionais e SOMASES',
              duracaoMinutos: 18,
              tipo: TipoAula.video,
              concluida: false,
            ),
            Aula(
              titulo: 'Tabelas dinâmicas para indicadores de qualidade',
              duracaoMinutos: 22,
              tipo: TipoAula.video,
              concluida: false,
            ),
          ],
        ),
        Modulo(
          titulo: 'Automatizando Relatórios',
          aulas: [
            Aula(
              titulo: 'Gráficos dinâmicos e painéis de indicadores',
              duracaoMinutos: 20,
              tipo: TipoAula.video,
              concluida: false,
            ),
            Aula(
              titulo: 'Formatação condicional para alertas visuais',
              duracaoMinutos: 12,
              tipo: TipoAula.leitura,
              concluida: false,
            ),
            Aula(
              titulo: 'Introdução a macros e automação',
              duracaoMinutos: 16,
              tipo: TipoAula.leitura,
              concluida: false,
            ),
            Aula(
              titulo: 'Quiz: Excel avançado para análise de dados',
              duracaoMinutos: 10,
              tipo: TipoAula.quiz,
              concluida: false,
            ),
          ],
        ),
      ],
    ),
  ];
}

/// Categorias existentes entre os cursos, com "Todas" na frente para uso
/// direto nos filtros (ChoiceChip) da tela de Cursos.
List<String> getCategoriasCursos() {
  final categorias = getAllCursos().map((curso) => curso.categoria).toSet().toList();
  categorias.sort();
  return ['Todas', ...categorias];
}

/// Filtra os cursos por termo de busca (no título) e por categoria.
/// Use `categoria: 'Todas'` (padrão) para nao filtrar por categoria.
List<Curso> filtrarCursos({String busca = '', String categoria = 'Todas'}) {
  final termo = busca.trim().toLowerCase();
  return getAllCursos().where((curso) {
    final combinaCategoria = categoria == 'Todas' || curso.categoria == categoria;
    final combinaBusca =
        termo.isEmpty || curso.titulo.toLowerCase().contains(termo);
    return combinaCategoria && combinaBusca;
  }).toList();
}
