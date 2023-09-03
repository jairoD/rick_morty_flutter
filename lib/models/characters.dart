import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:rick_morty/models/locations.dart';

class Characters {
  int id;
  String name;
  String status;
  String species;
  String? type;
  String gender;
  Locations origin;
  Locations location;
  String image;
  List<String> episode;
  String url;
  String created;
  Characters({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  Characters copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    Locations? origin,
    Locations? location,
    String? image,
    List<String>? episode,
    String? url,
    String? created,
  }) {
    return Characters(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      origin: origin ?? this.origin,
      location: location ?? this.location,
      image: image ?? this.image,
      episode: episode ?? this.episode,
      url: url ?? this.url,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin.toMap(),
      'location': location.toMap(),
      'image': image,
      'episode': episode,
      'url': url,
      'created': created,
    };
  }

  factory Characters.fromMap(Map<String, dynamic> map) {
    return Characters(
      id: (map['id'] ?? 0) as int,
      name: (map['name'] ?? '') as String,
      status: (map['status'] ?? '') as String,
      species: (map['species'] ?? '') as String,
      type: map['type'] != null ? map['type'] as String : null,
      gender: (map['gender'] ?? '') as String,
      origin: Locations.fromMap(map['origin'] as Map<String, dynamic>),
      location: Locations.fromMap(map['location'] as Map<String, dynamic>),
      image: (map['image'] ?? '') as String,
      episode: List<String>.from(map['episode']),
      url: (map['url'] ?? '') as String,
      created: (map['created'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Characters.fromJson(String source) =>
      Characters.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Characters(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episode: $episode, url: $url, created: $created)';
  }

  @override
  bool operator ==(covariant Characters other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.name == name &&
        other.status == status &&
        other.species == species &&
        other.type == type &&
        other.gender == gender &&
        other.origin == origin &&
        other.location == location &&
        other.image == image &&
        listEquals(other.episode, episode) &&
        other.url == url &&
        other.created == created;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        status.hashCode ^
        species.hashCode ^
        type.hashCode ^
        gender.hashCode ^
        origin.hashCode ^
        location.hashCode ^
        image.hashCode ^
        episode.hashCode ^
        url.hashCode ^
        created.hashCode;
  }
}
