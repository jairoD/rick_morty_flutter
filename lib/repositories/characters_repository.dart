import 'package:rick_morty/models/characters.dart';

abstract class CharactersRepository {
  Future<List<Characters>> getCharacters(String page);
}
