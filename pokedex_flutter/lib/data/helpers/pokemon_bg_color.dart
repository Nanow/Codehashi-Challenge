import 'package:flutter/material.dart';

Color pokemonBgColor(String pokemontype) {
  if (pokemontype.toLowerCase() == "grass") {
    return Colors.green;
  }
  if (pokemontype.toLowerCase() == "fire") {
    return Colors.red;
  }
  if (pokemontype.toLowerCase() == "water") {
    return Colors.blue;
  }
  return Colors.grey;
}
