import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_flutter/data/pokemon_repository.dart';
import 'package:pokedex_flutter/domain/entities/pokemon_entity.dart';
import 'package:pokedex_flutter/domain/repositories/repositories.dart';

class LocalListPokemon {
  final PokemonRepository _repository;

  LocalListPokemon(this._repository);

  List<PokemonEntity> fetchAll() {
    return this._repository.getPokemon();
  }
}

class LocalPokemonRepositorySpy extends Mock implements LocalPokemonRepository {
}

main() {
  LocalListPokemon sut;
  PokemonRepository repository;

  setUp(() {
    repository = LocalPokemonRepositorySpy();
    sut = LocalListPokemon(repository);
  });

  PostExpectation mockRequest() => when(repository.getPokemon());

  void mockSucess() =>
      mockRequest().thenAnswer((_) => LocalPokemonRepositorySpy().getPokemon());

  test('Verify if local fetchAll calls the getPokemon method', () async {
    sut.fetchAll();
    verify(repository.getPokemon());
  });
}
