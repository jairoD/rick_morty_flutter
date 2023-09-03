import 'package:flutter/material.dart';
import 'package:rick_morty/models/characters.dart' as CharactersInfo;
import 'package:rick_morty/pages/characters_page/characters_page_detail.dart';

class CharacterDetail extends StatelessWidget {
  final CharactersInfo.Characters info;

  const CharacterDetail({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CharactersPageDetails(info: info),
              )),
          child: ClipOval(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(info.image))),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      info.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      'Status: ${info.status}',
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 12),
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
