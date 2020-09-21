import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_flutter/app/list/components/components.dart';
import 'package:pokedex_flutter/app/list/list.dart';
import 'package:pokedex_flutter/data/models/models.dart';

class PokemonListControllerSpy extends Mock implements PokemonListController {}

main() {
  PokemonListController sut;
  StreamController<bool> isLoadingController;
  StreamController<List<PokemonModel>> pokemonsController;

  void initStream() {
    isLoadingController = StreamController<bool>();
    pokemonsController = StreamController<List<PokemonModel>>();
    when(sut.isLoadingController).thenAnswer((_) => isLoadingController.stream);
    when(sut.pokemonsController).thenAnswer((_) => pokemonsController.stream);
    isLoadingController.add(true);
  }

  Future<void> loadPage(WidgetTester tester) async {
    sut = PokemonListControllerSpy();
    initStream();
    final listPage = MaterialApp(home: PokemonListPage(controller: sut));
    await tester.pumpWidget(listPage);
  }

  tearDown(() {
    isLoadingController?.close();
    pokemonsController?.close();
  });

  testWidgets(
      'Should show loading if stramController isLoadingController is true',
      (WidgetTester tester) async {
    await loadPage(tester);
    isLoadingController.add(true);
    await tester.pump(Duration.zero);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'Should remove loading if stramController isLoadingController is false',
      (WidgetTester tester) async {
    await loadPage(tester);

    isLoadingController.add(false);
    pokemonsController.add([]);
    await tester.pump(Duration.zero);

    expect(find.byType(CircularProgressIndicator), findsNothing);
  });
  testWidgets('Should fetchPokemons is called on page start', (
    WidgetTester tester,
  ) async {
    await loadPage(tester);
    verify(sut.fetchPokemons()).called(1);
  });
  testWidgets('Should Show Pokemons list', (
    WidgetTester tester,
  ) async {
    await loadPage(tester);
    isLoadingController.add(false);
    pokemonsController.add([
      PokemonModel(
        number: "100",
        name: "Calangomon",
        color: Colors.red,
        imageUrl: "https://pokeres.bastionbot.org/images/pokemon/1.png",
        type: "Grass",
      ),
    ]);
    await tester.pump(Duration.zero);
    expect(find.byType(PokemonCard), findsOneWidget);
  });
}
