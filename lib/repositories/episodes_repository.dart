import 'package:rick_morty/models/episodes.dart';

abstract class EpisodesRepository {
  Future<List<Episodes>> getAllAepisodes(String page);
}
