import 'package:flutter/foundation.dart';
import 'package:rick_morty/models/characters.dart';
import 'package:rick_morty/services/characters_service.dart';

class CharacterController with ChangeNotifier {
  final CharactersService _charactersService = CharactersService();
  List<Characters> currentCharacters = [];
  int page = 1;
  bool loading = false;
  CharacterController() {
    getAllCharacters();
  }

  changeLoading() {
    loading = !loading;
    notifyListeners();
  }

  Future<void> getAllCharacters() async {
    changeLoading();
    var response = await _charactersService.getCharacters(page.toString());
    if (response.isNotEmpty) page++;
    currentCharacters.addAll(response);
    changeLoading();
    notifyListeners();
  }
}
