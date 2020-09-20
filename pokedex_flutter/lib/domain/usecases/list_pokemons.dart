import 'package:pokedex_flutter/domain/entities/pokemon_entity.dart';

abstract class ListPokemons {
  Future<List<PokemonEntity>> fetchAll();
}
