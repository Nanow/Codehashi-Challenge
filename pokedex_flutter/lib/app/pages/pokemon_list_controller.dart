import 'dart:async';

import '../../domain/helpers/helpers.dart';
import '../../data/models/models.dart';

abstract class PokemonListController {
  Stream<List<PokemonModel>> get pokemonsController;
  Stream<DomainError> get errorController;

  void fetchPokemons();

  dispose();
}
