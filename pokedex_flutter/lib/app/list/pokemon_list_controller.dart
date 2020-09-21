import '../../data/models/models.dart';

abstract class PokemonListController {
  Stream<List<PokemonModel>> pokemonsStream;
}
