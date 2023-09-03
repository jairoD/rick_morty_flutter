import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/controllers/episodes_controller.dart';

class EpisodesPage extends StatefulWidget {
  const EpisodesPage({super.key});

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
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
    var episodesInfo = context.watch<EpisodesController>();
    return Container(
      padding: const EdgeInsets.all(12),
      child: Stack(
        children: [
          ListView.separated(
            controller: _scrollController,
            separatorBuilder: (_, __) => const Divider(),
            itemCount: episodesInfo.currentEpisodes.length,
            itemBuilder: (_, i) => ListTile(
              subtitle: Text(
                  'episode: ${episodesInfo.currentEpisodes[i].episode}',
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color(0xffa6cccc))),
              title: Text(episodesInfo.currentEpisodes[i].name.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xffa6cccc))),
            ),
          ),
          episodesInfo.loading
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
      context.read<EpisodesController>().getAllLocations();
    }
  }
}
