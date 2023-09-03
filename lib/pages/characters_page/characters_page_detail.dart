import 'package:flutter/material.dart';
import 'package:rick_morty/models/characters.dart' as CharactersInfo;
import 'package:rick_morty/pages/widgets/info_detail.dart';

class CharactersPageDetails extends StatelessWidget {
  final CharactersInfo.Characters info;
  const CharactersPageDetails({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipOval(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Image(
                  image: NetworkImage(
                    info.image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              info.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color(0xffa6cccc),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            InfoDetail(label: 'Status: ', value: info.status),
            InfoDetail(label: 'species: ', value: info.species),
            InfoDetail(label: 'type: ', value: info.type ?? 'no data'),
            InfoDetail(label: 'gender: ', value: info.gender)
          ],
        ),
      ),
    );
  }
}
