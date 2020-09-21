import 'package:flutter/material.dart';

Color pokemonBgColorFactory(String pokemontype) {
  if (pokemontype.toLowerCase() == "grass") {
    return Color(0xFF48D0B0);
  }
  if (pokemontype.toLowerCase() == "fire") {
    return Color(0xFFFB6C6C);
  }
  if (pokemontype.toLowerCase() == "water") {
    return Color(0xFF0085FF);
  }
  return Colors.grey;
}
