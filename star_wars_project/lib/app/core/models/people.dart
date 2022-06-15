class People {
  final int? id;
  final String? name;
  final String? height;
  final String? mass;
  final String? gender;
  final String? homeworld;
  final String? wiki;
  final String? image;
  final String? born;
  final String? bornLocation;
  final String? died;
  final String? diedLocation;
  final String? species;
  final String? hairColor;
  final String? eyeColor;
  final String? skinColor;
  final String? cybernetics;

  People({
    required this.id,
    required this.name,
    required this.height,
    required this.mass,
    required this.gender,
    required this.homeworld,
    required this.wiki,
    required this.image,
    required this.born,
    required this.bornLocation,
    required this.died,
    required this.diedLocation,
    required this.species,
    required this.hairColor,
    required this.eyeColor,
    required this.skinColor,
    required this.cybernetics,
  });

  factory People.fromJson(Map<String, dynamic> json) {
    return People(
      id: json['id'],
      name: json['name'],
      height: json['height'].toString(),
      mass: json['mass'].toString(),
      gender: json['gender'],
      homeworld: json['homeworld'].toString(),
      wiki: json['wiki'],
      image: json['image'],
      born: json['born'].toString(),
      bornLocation: json['bornLocation'].toString(),
      died: json['died'].toString(),
      diedLocation: json['diedLocation'].toString(),
      species: json['species'].toString(),
      hairColor: json['hairColor'].toString(),
      eyeColor: json['eyeColor'].toString(),
      skinColor: json['skinColor'].toString(),
      cybernetics: json['cybernetics'].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'height': height,
      'mass': mass,
      'gender': gender,
      'homeworld': homeworld,
      'wiki': wiki,
      'image': image,
      'born': born,
      'bornLocation': bornLocation,
      'died': died,
      'diedLocation': diedLocation,
      'species': species,
      'hairColor': hairColor,
      'eyeColor': eyeColor,
      'skinColor': skinColor,
      'cybernetics': cybernetics,
    };
  }
}
