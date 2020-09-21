import '../../domain/entities/entities.dart';

abstract class ListPokemons {
  List<PokemonEntity> fetchAll();
}
