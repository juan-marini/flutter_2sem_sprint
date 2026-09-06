import '../model/conquista.dart';
import '../model/tipo_conquista.dart';

/// Conquistas da trilha de estudos do colaborador logado.
List<Conquista> getAllConquistas() {
  return const [
    Conquista(
      titulo: 'Primeiro Passo',
      descricao: 'Concluiu o primeiro curso obrigatório no EducaMais.',
      tipo: TipoConquista.conclusao,
      desbloqueada: true,
    ),
    Conquista(
      titulo: 'Ofensiva de 7 Dias',
      descricao: 'Estudou por 7 dias seguidos sem interromper a sequência.',
      tipo: TipoConquista.ofensiva,
      desbloqueada: true,
    ),
    Conquista(
      titulo: 'Presença nas Salas',
      descricao: 'Participou de 5 Salas de Estudo diferentes.',
      tipo: TipoConquista.participacao,
      desbloqueada: true,
    ),
    Conquista(
      titulo: 'Destaque do Trimestre',
      descricao:
          'Ficou entre os 10% com melhor desempenho da área no '
          'trimestre.',
      tipo: TipoConquista.destaque,
      desbloqueada: false,
    ),
  ];
}
