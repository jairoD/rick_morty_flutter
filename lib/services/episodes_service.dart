import 'dart:convert';

import 'package:rick_morty/models/episodes.dart';
import 'package:rick_morty/repositories/episodes_repository.dart';
import 'package:rick_morty/repositories/generic_repository.dart';

class EpisodesService implements EpisodesRepository {
  final GenericRepository _genericRepository = GenericRepository();

  @override
  Future<List<Episodes>> getAllAepisodes(String page) async {
    try {
      var response = await _genericRepository.getInfo("episode", page);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<dynamic> allEntities = data["results"];
        return allEntities.map((e) => Episodes.fromMap(e)).toList();
      } else {
        return List<Episodes>.from([]);
      }
    } catch (e) {
      return List<Episodes>.from([]);
    }
  }
}
