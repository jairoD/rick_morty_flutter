import 'package:rick_morty/models/locations.dart';

abstract class LocationsRepository {
  Future<List<Locations>> getAllLocations(String page);
}
