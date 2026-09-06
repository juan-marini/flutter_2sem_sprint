/// Nivel de risco de evasao de um colaborador em um curso.
enum RiscoEvasao {
  baixo('Em dia'),
  medio('Atenção'),
  alto('Risco alto');

  final String label;
  const RiscoEvasao(this.label);
}
