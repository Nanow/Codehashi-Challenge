import 'package:pokedex_flutter/domain/entities/entities.dart';
import 'package:pokedex_flutter/domain/helpers/helpers.dart';
import 'package:pokedex_flutter/domain/repositories/repositories.dart';

class LocalListPokemon {
  final PokemonRepository _repository;

  LocalListPokemon(this._repository);

  List<PokemonEntity> fetchAll() {
    try {
      return this._repository.getPokemon();
    } catch (e) {
      throw DomainError.unexpected;
    }
  }
}
