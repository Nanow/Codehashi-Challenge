import '../entities/entities.dart';

abstract class PokemonRepository {
  List<PokemonEntity> getPokemon();
}
