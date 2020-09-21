import 'package:flutter/material.dart';

import './components/components.dart';
import '../components/components.dart';
import '../pages/pages.dart';

import '../../data/models/models.dart';
import '../../domain/helpers/domain_error.dart';

class PokemonListPage extends StatefulWidget {
  final PokemonListController controller;

  PokemonListPage({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  _PokemonListPageState createState() => _PokemonListPageState(controller);
}

class _PokemonListPageState extends State<PokemonListPage> {
  final PokemonListController controller;

  _PokemonListPageState(this.controller);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchPokemons();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pokedex",
          style: TextStyle(),
        ),
      ),
      body: Builder(
        builder: (context) {
          controller.errorController.listen((DomainError error) {
            if (error != null) showErrorMessage(context, error.description);
          });
          return PokdexGrid(controller: controller);
        },
      ),
    );
  }
}

class PokdexGrid extends StatelessWidget {
  const PokdexGrid({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final PokemonListController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder<List<PokemonModel>>(
      stream: controller.pokemonsController,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          itemCount: snapshot.data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: size.width / 300,
          ),
          itemBuilder: (BuildContext context, int index) {
            return PokemonCard(
              pokemon: snapshot.data[index],
            );
          },
        );
      },
    );
  }
}
