import 'dart:convert';

import 'package:rick_morty/models/characters.dart';
import 'package:rick_morty/repositories/characters_repository.dart';
import 'package:rick_morty/repositories/generic_repository.dart';

class CharactersService implements CharactersRepository {
  final GenericRepository _genericRepository = GenericRepository();

  @override
  Future<List<Characters>> getCharacters(String page) async {
    try {
      var response = await _genericRepository.getInfo("character", page);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<dynamic> allEntities = data["results"];
        return allEntities.map((e) => Characters.fromMap(e)).toList();
      } else {
        return List<Characters>.from([]);
      }
    } catch (e) {
      return List<Characters>.from([]);
    }
  }
}
