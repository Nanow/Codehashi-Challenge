import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './components/components.dart';

import '../list/pokemon_list_controller.dart';
import '../../data/models/models.dart';
import '../../domain/entities/entities.dart';

class PokemonListPage extends StatelessWidget {
  final PokemonListController controller;

  final pokemon = PokemonModel.fromEntity(
    PokemonEntity(
      id: 1,
      name: "Bulbasaur",
      imageUrl: "https://pokeres.bastionbot.org/images/pokemon/1.png",
      type: "Fire",
    ),
  );

  PokemonListPage({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex ${size.width}"),
      ),
      body: StreamBuilder<bool>(
          stream: controller.isLoadingController,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data) {
              return const Center(
                child: const CircularProgressIndicator(),
              );
            }
            return StreamBuilder<List<PokemonModel>>(
                stream: controller.pokemonsController,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return GridView.builder(
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: size.width / 300,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return PokemonCard(
                        pokemon: pokemon,
                      );
                    },
                  );
                });
          }),
    );
  }
}
