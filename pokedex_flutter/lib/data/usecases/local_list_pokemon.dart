import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/repositories/repositories.dart';

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
