/// Tipo de conteudo de uma aula dentro de um modulo.
enum TipoAula {
  video('Vídeo'),
  leitura('Leitura'),
  quiz('Quiz'),
  aoVivo('Ao vivo');

  final String label;
  const TipoAula(this.label);
}
