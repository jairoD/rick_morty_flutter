import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/controllers/characters_controller.dart';
import 'package:rick_morty/pages/characters_page/widgets/character_detail.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _onScroll(context);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var charactersInfo = context.watch<CharacterController>();
    return Container(
      padding: const EdgeInsets.all(12),
      child: Stack(
        children: [
          GridView.builder(
            controller: _scrollController,
            itemCount: charactersInfo.currentCharacters.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 2),
            itemBuilder: (_, i) => SizedBox(
              width: double.infinity,
              child: CharacterDetail(info: charactersInfo.currentCharacters[i]),
            ),
          ),
          charactersInfo.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  void _onScroll(BuildContext context) {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<CharacterController>().getAllCharacters();
    }
  }
}
