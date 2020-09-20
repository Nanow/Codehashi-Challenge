import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_flutter/data/models/pokemon_model.dart';
import 'package:pokedex_flutter/data/pokemon_repository.dart';
import 'package:pokedex_flutter/domain/entities/pokemon_entity.dart';
import 'package:pokedex_flutter/domain/helpers/domain_error.dart';
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
