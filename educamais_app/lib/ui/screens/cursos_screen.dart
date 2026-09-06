import 'package:flutter/material.dart';

import '../../navigation/app_routes.dart';
import '../../repository/curso_repository.dart';
import '../../theme/app_colors.dart';
import '../components/curso_card.dart';

/// Aba Cursos: lista vertical dos cursos, com busca, filtro por
/// categoria, contador de resultados e estado vazio.
class CursosScreen extends StatefulWidget {
  const CursosScreen({super.key});

  @override
  State<CursosScreen> createState() => _CursosScreenState();
}

class _CursosScreenState extends State<CursosScreen> {
  final TextEditingController _buscaController = TextEditingController();
  String _categoriaSelecionada = 'Todas';

  @override
  void initState() {
    super.initState();
    _buscaController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _buscaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categorias = getCategoriasCursos();
    final cursos = filtrarCursos(
      busca: _buscaController.text,
      categoria: _categoriaSelecionada,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _buscaController,
            decoration: InputDecoration(
              hintText: 'Buscar curso pelo título',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: AppColors.divisorClaro),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categorias.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final categoria = categorias[index];
                return ChoiceChip(
                  label: Text(categoria),
                  selected: _categoriaSelecionada == categoria,
                  onSelected: (selecionado) {
                    setState(() {
                      _categoriaSelecionada = selecionado
                          ? categoria
                          : 'Todas';
                    });
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '${cursos.length} curso(s) encontrado(s)',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: cursos.isEmpty
                ? const _EstadoVazioCursos()
                : ListView.separated(
                    padding: const EdgeInsets.only(bottom: 96),
                    itemCount: cursos.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final curso = cursos[index];
                      return CursoCard(
                        curso: curso,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.cursoDetalhe,
                            arguments: curso,
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _EstadoVazioCursos extends StatelessWidget {
  const _EstadoVazioCursos();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search_off,
              size: 40,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 12),
            Text(
              'Nenhum curso encontrado',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              'Tente outro termo de busca ou categoria.',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
