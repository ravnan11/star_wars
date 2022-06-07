class People {
  final String name;
  final String birthDate;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String gender;
  final String height;

  People({
    required this.birthDate,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.gender,
    required this.height,
    required this.name,
  });

  factory People.fromJson(Map<String, dynamic> json) {
    return People(
      name: json['name'] as String,
      birthDate: json['birth_year'] as String,
      mass: json['mass'] as String,
      hairColor: json['hair_color'] as String,
      skinColor: json['skin_color'] as String,
      eyeColor: json['eye_color'] as String,
      gender: json['gender'] as String,
      height: json['height'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mass': mass,
      'hair_color': hairColor,
      'skin_color': skinColor,
      'eye_color': eyeColor,
      'birth_year': birthDate,
      'height': height,
      'gender': gender
    };
  }
}
