import 'package:pokedex_flutter/domain/entities/pokemon_entity.dart';

abstract class ListPokemons {
  List<PokemonEntity> fetchAll();
}
