import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';
import '../helpers/helpers.dart';

class PokemonModel {
  final String number;
  final String name;
  final String imageUrl;
  final String type;
  final Color color;

  PokemonModel({this.number, this.name, this.imageUrl, this.type, this.color});

  factory PokemonModel.fromEntity(PokemonEntity entity) {
    return PokemonModel(
      number: pokemonFactoryNumber(entity.id),
      name: entity.name,
      imageUrl: entity.imageUrl,
      type: entity.type,
      color: pokemonBgColorFactory(entity.type),
    );
  }
}
