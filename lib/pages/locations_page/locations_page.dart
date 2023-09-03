import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/controllers/locations_controller.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({super.key});

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
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
    var locationsInfo = context.watch<LocationsController>();
    return Container(
      padding: const EdgeInsets.all(12),
      child: Stack(
        children: [
          ListView.separated(
            controller: _scrollController,
            separatorBuilder: (_, __) => const Divider(),
            itemCount: locationsInfo.currentLocations.length,
            itemBuilder: (_, i) => ListTile(
              subtitle: Text(
                  'type: ${locationsInfo.currentLocations[i].type ?? 'unknown'}',
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color(0xffa6cccc))),
              title: Text(locationsInfo.currentLocations[i].name ?? 'unknown',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xffa6cccc))),
            ),
          ),
          locationsInfo.loading
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
      context.read<LocationsController>().getAllLocations();
    }
  }
}
