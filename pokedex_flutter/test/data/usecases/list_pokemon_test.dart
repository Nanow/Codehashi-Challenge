import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_flutter/data/pokemon_repository.dart';
import 'package:pokedex_flutter/domain/entities/pokemon_entity.dart';

class LocalListPokemon {
  final PokemonRepository _repository;

  LocalListPokemon(this._repository);

  List<PokemonEntity> fetchAll() {
    return this._repository.getPokemon();
  }
}

class PokemonRepositorySpy extends Mock implements PokemonRepository {}

main() {
  LocalListPokemon sut;
  PokemonRepository repository;

  setUp(() {
    repository = PokemonRepositorySpy();
    sut = LocalListPokemon(repository);
  });

  PostExpectation mockRequest() => when(repository.getPokemon());

  void mockSucess() =>
      mockRequest().thenAnswer((_) => PokemonRepository().getPokemon());

  test('Verify if local fetchAll calls the getPokemon method', () async {
    sut.fetchAll();
    verify(repository.getPokemon());
  });
}
