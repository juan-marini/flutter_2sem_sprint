import 'package:flutter/material.dart';

import '../../model/autor_mensagem.dart';
import '../../model/mensagem_edia.dart';
import '../../repository/edia_repository.dart';
import '../../theme/app_colors.dart';
import '../components/app_top_bar.dart';

/// Chat da EdIA. O [cursoTitulo] e opcional: chega preenchido quando o
/// chat e aberto a partir do detalhe de um curso, e nulo quando aberto
/// pelo botao flutuante da Home.
class ChatEdiaScreen extends StatefulWidget {
  final String? cursoTitulo;
  final VoidCallback onBackClick;

  const ChatEdiaScreen({
    super.key,
    this.cursoTitulo,
    required this.onBackClick,
  });

  @override
  State<ChatEdiaScreen> createState() => _ChatEdiaScreenState();
}

class _ChatEdiaScreenState extends State<ChatEdiaScreen> {
  final TextEditingController _mensagemController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<MensagemEdia> _mensagens = [];

  bool _consultando = false;
  bool _primeiraPergunta = true;

  @override
  void initState() {
    super.initState();
    final cursoTitulo = widget.cursoTitulo;
    _mensagens.add(
      cursoTitulo == null
          ? MensagemEdia.daEdia(
              'Olá! Eu sou a EdIA. Posso responder dúvidas sobre o '
              'material dos seus treinamentos, sempre com a fonte exata. '
              'Pergunte algo ou escolha uma sugestão abaixo.',
            )
          : MensagemEdia.daEdia(
              'Você está no chat sobre "$cursoTitulo". Pergunte algo '
              'sobre o conteúdo desse curso ou escolha uma sugestão '
              'abaixo.',
            ),
    );
  }

  @override
  void dispose() {
    _mensagemController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _rolarParaFinal() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _enviarPergunta(String pergunta) async {
    final texto = pergunta.trim();
    if (texto.isEmpty || _consultando) {
      return;
    }

    _mensagemController.clear();
    setState(() {
      _mensagens.add(MensagemEdia.doAluno(texto));
      _primeiraPergunta = false;
      _consultando = true;
    });
    _rolarParaFinal();

    await Future.delayed(const Duration(milliseconds: 900));

    if (!mounted) {
      return;
    }

    setState(() {
      _mensagens.add(responder(texto));
      _consultando = false;
    });
    _rolarParaFinal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(titulo: 'EdIA', onBackClick: widget.onBackClick),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ..._mensagens.map(
                    (mensagem) => _MensagemBubble(mensagem: mensagem),
                  ),
                  if (_consultando) const _ConsultandoIndicator(),
                  if (_primeiraPergunta)
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: getSugestoesPerguntas().map((sugestao) {
                        return ActionChip(
                          label: Text(sugestao),
                          onPressed: () {
                            _enviarPergunta(sugestao);
                          },
                        );
                      }).toList(),
                    ),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _mensagemController,
                      decoration: InputDecoration(
                        hintText: 'Pergunte algo à EdIA',
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.surface,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(999),
                          borderSide: const BorderSide(
                            color: AppColors.divisorClaro,
                          ),
                        ),
                      ),
                      onSubmitted: (texto) {
                        _enviarPergunta(texto);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton.filled(
                    onPressed: _consultando
                        ? null
                        : () {
                            _enviarPergunta(_mensagemController.text);
                          },
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MensagemBubble extends StatelessWidget {
  final MensagemEdia mensagem;

  const _MensagemBubble({required this.mensagem});

  @override
  Widget build(BuildContext context) {
    final ehAluno = mensagem.autor == AutorMensagem.aluno;
    final colorScheme = Theme.of(context).colorScheme;

    return Align(
      alignment: ehAluno ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.78,
        ),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: ehAluno ? colorScheme.primary : colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: ehAluno ? null : Border.all(color: AppColors.divisorClaro),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              mensagem.texto,
              style: TextStyle(color: ehAluno ? colorScheme.onPrimary : null),
            ),
            if (mensagem.fonte != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.ciano.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.menu_book,
                      size: 14,
                      color: AppColors.azulEletrico,
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        mensagem.fonte!,
                        style: Theme.of(context).textTheme.labelSmall
                            ?.copyWith(
                              color: AppColors.azulEletrico,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ConsultandoIndicator extends StatelessWidget {
  const _ConsultandoIndicator();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.divisorClaro),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(width: 10),
            Text(
              'Consultando o material...',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
