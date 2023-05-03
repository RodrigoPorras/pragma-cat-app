import 'package:equatable/equatable.dart';

class Cat extends Equatable {
  final String id;
  final String name;
  final String origin;
  final String description;
  final String lifeSpan;
  final int adaptability;
  final int affectionLevel;
  final int intelligence;
  final String referenceImageId;

  const Cat({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.adaptability,
    required this.affectionLevel,
    required this.intelligence,
    required this.referenceImageId,
  });

  factory Cat.fromMap(Map<String, dynamic> map) {
    return Cat(
      id: map['id'] as String,
      name: map['name'] as String,
      origin: map['origin'] as String,
      description: map['description'] as String,
      lifeSpan: map['life_span'],
      adaptability: map['adaptability'] as int,
      affectionLevel: map['affection_level'] as int,
      intelligence: map['intelligence'] as int,
      referenceImageId: map['reference_image_id'] != null ? map['reference_image_id'] as String : '',
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        origin,
        description,
        lifeSpan,
        adaptability,
        affectionLevel,
        intelligence,
        referenceImageId,
      ];
}
