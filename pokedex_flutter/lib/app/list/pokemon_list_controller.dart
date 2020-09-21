import 'dart:async';

import '../../data/models/models.dart';

abstract class PokemonListController {
  Stream<List<PokemonModel>> pokemonsController;
  Stream<bool> isLoadingController;

  void fetchPokemons();

  dispose();
}
