import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_flutter/app/pages/components/components.dart';
import 'package:pokedex_flutter/app/pages/pages.dart';
import 'package:pokedex_flutter/data/models/models.dart';
import 'package:pokedex_flutter/domain/helpers/helpers.dart';

class PokemonListControllerSpy extends Mock implements PokemonListController {}

main() {
  PokemonListController sut;

  StreamController<List<PokemonModel>> pokemonsController;
  StreamController<DomainError> errorController;

  void initStream() {
    errorController = StreamController<DomainError>();
    pokemonsController = StreamController<List<PokemonModel>>();

    when(sut.pokemonsController).thenAnswer((_) => pokemonsController.stream);
    when(sut.errorController).thenAnswer((_) => errorController.stream);
  }

  Future<void> loadPage(WidgetTester tester) async {
    sut = PokemonListControllerSpy();
    initStream();
    final listPage = MaterialApp(home: PokemonListPage(controller: sut));
    await tester.pumpWidget(listPage);
  }

  tearDown(() {
    pokemonsController?.close();
    errorController?.close();
  });

  testWidgets(
      'Should show loading if stramController isLoadingController is true',
      (WidgetTester tester) async {
    await loadPage(tester);

    await tester.pump(Duration.zero);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'Should remove loading if stramController isLoadingController is false',
      (WidgetTester tester) async {
    await loadPage(tester);

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
  testWidgets('Should ask to user to retry if has error', (
    WidgetTester tester,
  ) async {
    await loadPage(tester);
    pokemonsController.add([]);

    errorController.add(DomainError.unexpected);
    await tester.pump();

    expect(
      find.byType(
        SnackBar,
      ),
      findsOneWidget,
    );
  });
}
