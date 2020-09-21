import 'dart:async';

import '../../domain/helpers/helpers.dart';
import '../../data/models/models.dart';

abstract class PokemonListController {
  Stream<List<PokemonModel>> pokemonsController;
  Stream<bool> isLoadingController;
  Stream<DomainError> errorController;

  void fetchPokemons();

  dispose();
}
