import 'package:pokedex_flutter/domain/entities/entities.dart';

abstract class PokemonRepository {
  List<PokemonEntity> getPokemon();
}
