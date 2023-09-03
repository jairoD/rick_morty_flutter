import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/controllers/characters_controller.dart';
import 'package:rick_morty/controllers/episodes_controller.dart';
import 'package:rick_morty/controllers/locations_controller.dart';
import 'package:rick_morty/pages/home_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CharacterController()),
    ChangeNotifierProvider(create: (_) => LocationsController()),
    ChangeNotifierProvider(create: (_) => EpisodesController())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
