import '../model/usuario.dart';

/// O colaborador atualmente logado no EducaMais.
Usuario getUsuarioLogado() {
  return const Usuario(
    nome: 'Marina Ferreira Costa',
    cargo: 'Analista de Garantia da Qualidade',
    area: 'Qualidade e Compliance',
    matricula: 'EF-48213',
    nivel: 4,
    xp: 2380,
    xpProximoNivel: 3000,
    ofensivaDias: 6,
    cursosConcluidos: 3,
    horasEstudo: 42.5,
  );
}
