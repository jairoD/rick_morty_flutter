import 'dart:convert';

import 'package:rick_morty/models/locations.dart';
import 'package:rick_morty/repositories/generic_repository.dart';
import 'package:rick_morty/repositories/locations_repository.dart';

class LocationsService implements LocationsRepository {
  final GenericRepository _genericRepository = GenericRepository();

  @override
  Future<List<Locations>> getAllLocations(String page) async {
    try {
      var response = await _genericRepository.getInfo("location", page);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<dynamic> allEntities = data["results"];
        return allEntities.map((e) => Locations.fromMap(e)).toList();
      } else {
        return List<Locations>.from([]);
      }
    } catch (e) {
      return List<Locations>.from([]);
    }
  }
}
