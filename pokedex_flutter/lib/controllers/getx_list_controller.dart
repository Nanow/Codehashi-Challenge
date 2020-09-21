import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../app/pages/pages.dart';
import '../data/models/models.dart';
import '../domain/helpers/helpers.dart';
import '../domain/repositories/repositories.dart';

class GetxListController extends GetxController
    implements PokemonListController {
  final PokemonRepository repository;
  final _errorController = Rx<DomainError>();
  final _pokemonsController = Rx<List<PokemonModel>>();

  GetxListController({@required this.repository});

  Stream<DomainError> get errorController => _errorController.stream;
  Stream<List<PokemonModel>> get pokemonsController =>
      _pokemonsController.stream;

  @override
  dispose() {
    _errorController.close();

    _pokemonsController.close();
  }

  @override
  void fetchPokemons() {
    try {
      final response = repository
          .getPokemon()
          .map((e) => PokemonModel.fromEntity(e))
          .toList();
      this._pokemonsController.value = response;
    } on DomainError catch (e) {
      _errorController.value = e;
    }
  }
}
