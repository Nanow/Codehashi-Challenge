import 'package:flutter/material.dart';

import '../helpers/helpers.dart';
import '../../domain/entities/entities.dart';

class PokemonModel {
  final int id;
  final String name;
  final String imageUrl;
  final String type;
  final Color color;

  PokemonModel({this.id, this.name, this.imageUrl, this.type, this.color});

  factory PokemonModel.fromEntity(PokemonEntity entity) {
    return PokemonModel(
      id: entity.id,
      name: entity.name,
      imageUrl: entity.imageUrl,
      type: entity.type,
      color: pokemonBgColorFactory(entity.type),
    );
  }
}
