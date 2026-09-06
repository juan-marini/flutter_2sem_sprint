import 'package:flutter/material.dart';

import '../../model/conquista.dart';
import '../../model/tipo_conquista.dart';
import '../../navigation/app_routes.dart';
import '../../repository/conquista_repository.dart';
import '../../repository/usuario_repository.dart';
import '../../theme/app_colors.dart';
import '../components/indicator_card.dart';

/// Aba Perfil: avatar com iniciais, nível e XP, indicadores, conquistas,
/// botão Sobre e botão Sair.
class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usuario = getUsuarioLogado();
    final conquistas = getAllConquistas();
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 96),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: colorScheme.primary,
                child: Text(
                  usuario.iniciais,
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      usuario.nome,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${usuario.cargo} • ${usuario.area}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nível ${usuario.nivel}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '${usuario.xp}/${usuario.xpProximoNivel} XP',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: usuario.progressoNivel,
              minHeight: 8,
              backgroundColor: AppColors.divisorClaro,
              valueColor: AlwaysStoppedAnimation(colorScheme.primary),
            ),
          ),
          const SizedBox(height: 24),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: IndicatorCard(
                    icone: Icons.emoji_events_outlined,
                    valor: '${usuario.cursosConcluidos}',
                    rotulo: 'Cursos concluídos',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: IndicatorCard(
                    icone: Icons.schedule,
                    valor: '${usuario.horasEstudo.toStringAsFixed(1)}h',
                    rotulo: 'Horas de estudo',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: IndicatorCard(
                    icone: Icons.local_fire_department,
                    valor: '${usuario.ofensivaDias}',
                    rotulo: 'Dias de ofensiva',
                    corDestaque: AppColors.atencao,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Conquistas',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: conquistas.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.3,
            ),
            itemBuilder: (context, index) {
              return _ConquistaCard(conquista: conquistas[index]);
            },
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.sobre);
              },
              icon: const Icon(Icons.info_outline),
              label: const Text('Sobre o EducaMais'),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.login,
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Sair'),
              style: OutlinedButton.styleFrom(foregroundColor: AppColors.risco),
            ),
          ),
        ],
      ),
    );
  }
}

class _ConquistaCard extends StatelessWidget {
  final Conquista conquista;

  const _ConquistaCard({required this.conquista});

  IconData get _icone {
    switch (conquista.tipo) {
      case TipoConquista.ofensiva:
        return Icons.local_fire_department;
      case TipoConquista.conclusao:
        return Icons.emoji_events;
      case TipoConquista.participacao:
        return Icons.groups;
      case TipoConquista.destaque:
        return Icons.star;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bloqueada = !conquista.desbloqueada;

    return Opacity(
      opacity: bloqueada ? 0.5 : 1,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.divisorClaro),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(_icone, color: colorScheme.primary),
                if (bloqueada) const Icon(Icons.lock_outline, size: 18),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              conquista.titulo,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              conquista.descricao,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
