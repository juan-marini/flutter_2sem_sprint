import 'autor_mensagem.dart';

/// Uma mensagem trocada no chat da EdIA.
///
/// O campo [fonte] guarda a citacao do material (RAG) que fundamenta a
/// resposta da EdIA. Quando a EdIA nao encontra fonte, ela responde sem
/// citacao explicando que prefere nao arriscar uma resposta sem base --
/// e por isso [fonte] e sempre nullable.
class MensagemEdia {
  final String texto;
  final AutorMensagem autor;
  final String? fonte;

  const MensagemEdia({required this.texto, required this.autor, this.fonte});

  factory MensagemEdia.doAluno(String texto) {
    return MensagemEdia(texto: texto, autor: AutorMensagem.aluno);
  }

  factory MensagemEdia.daEdia(String texto, {String? fonte}) {
    return MensagemEdia(texto: texto, autor: AutorMensagem.edia, fonte: fonte);
  }
}
