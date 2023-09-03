import 'package:flutter/material.dart';
import 'package:rick_morty/models/episodes.dart';
import 'package:rick_morty/services/episodes_service.dart';

class EpisodesController with ChangeNotifier {
  final EpisodesService _episodesService = EpisodesService();
  List<Episodes> currentEpisodes = [];
  int page = 1;
  bool loading = false;
  EpisodesController() {
    getAllLocations();
  }

  changeLoading() {
    loading = !loading;
    notifyListeners();
  }

  Future<void> getAllLocations() async {
    changeLoading();
    var response = await _episodesService.getAllAepisodes(page.toString());
    if (response.isNotEmpty) page++;
    currentEpisodes.addAll(response);
    changeLoading();
    notifyListeners();
  }
}
