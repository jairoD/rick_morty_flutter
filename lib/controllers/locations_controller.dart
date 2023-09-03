import 'package:flutter/material.dart';
import 'package:rick_morty/models/locations.dart';
import 'package:rick_morty/services/locations_service.dart';

class LocationsController with ChangeNotifier {
  final LocationsService _locationsService = LocationsService();
  List<Locations> currentLocations = [];
  int page = 1;
  bool loading = false;
  LocationsController() {
    getAllLocations();
  }

  changeLoading() {
    loading = !loading;
    notifyListeners();
  }

  Future<void> getAllLocations() async {
    changeLoading();
    var response = await _locationsService.getAllLocations(page.toString());
    if (response.isNotEmpty) page++;
    currentLocations.addAll(response);
    changeLoading();
    notifyListeners();
  }
}
