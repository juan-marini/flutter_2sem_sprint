/// O colaborador logado no EducaMais.
class Usuario {
  final String nome;
  final String cargo;
  final String area;
  final String matricula;
  final int nivel;
  final int xp;
  final int xpProximoNivel;
  final int ofensivaDias;
  final int cursosConcluidos;
  final double horasEstudo;

  const Usuario({
    required this.nome,
    required this.cargo,
    required this.area,
    required this.matricula,
    required this.nivel,
    required this.xp,
    required this.xpProximoNivel,
    required this.ofensivaDias,
    required this.cursosConcluidos,
    required this.horasEstudo,
  });

  String get iniciais {
    final partes = nome.trim().split(RegExp(r'\s+'));
    if (partes.isEmpty || partes.first.isEmpty) {
      return '';
    }
    if (partes.length == 1) {
      return partes.first.substring(0, 1).toUpperCase();
    }
    final primeira = partes.first.substring(0, 1);
    final ultima = partes.last.substring(0, 1);
    return '$primeira$ultima'.toUpperCase();
  }

  String get primeiroNome => nome.trim().split(RegExp(r'\s+')).first;

  double get progressoNivel {
    if (xpProximoNivel == 0) {
      return 0;
    }
    return (xp / xpProximoNivel).clamp(0, 1);
  }
}
