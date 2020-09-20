import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:pokedex_flutter/data/pokemon_repository.dart';
import 'package:pokedex_flutter/data/usecases/usecases.dart';
import 'package:pokedex_flutter/domain/entities/entities.dart';
import 'package:pokedex_flutter/domain/helpers/helpers.dart';

class LocalPokemonRepositorySpy extends Mock implements LocalPokemonRepository {
}

main() {
  LocalListPokemon sut;
  LocalPokemonRepositorySpy repository;

  setUp(() {
    repository = LocalPokemonRepositorySpy();
    sut = LocalListPokemon(repository);
  });

  PostExpectation mockRequest() => when(repository.getPokemon());

  mockSucess() =>
      mockRequest().thenAnswer((_) => LocalPokemonRepository().getPokemon());

  mockError() => when(repository.getPokemon()).thenThrow(DomainError);

  test('Verify if local fetchAll calls the getPokemon method', () async {
    sut.fetchAll();
    verify(repository.getPokemon());
  });

  test('Verify if local fetchAll returns a list of PokemonEntity', () async {
    mockSucess();
    final result = sut.fetchAll();
    print(result.runtimeType);
    expect(result, isA<List<PokemonEntity>>());
  });

  test('Should throws DomainError.unexpected if local fetch throws', () async {
    mockError();
    expect(sut.fetchAll, throwsA(DomainError.unexpected));
  });
}
