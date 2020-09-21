import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/models/models.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonCard({
    Key key,
    @required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: pokemon.color,
        borderRadius: BorderRadius.circular(18),
      ),
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            pokemon.number,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            pokemon.name,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(
                    pokemon.type,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Flexible(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 55),
                  child: CachedNetworkImage(
                    imageUrl: pokemon.imageUrl,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
