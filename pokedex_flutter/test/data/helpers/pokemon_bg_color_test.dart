import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_flutter/data/helpers/helpers.dart';

main() {
  test(
    'Validate if pokemonBgColor will return red color for fire type',
    () {
      final color = pokemonBgColorFactory('fire');
      assert(color == Color(0xFFFB6C6C));
    },
  );
  test(
    'Validate if pokemonBgColor will return blue color for water type',
    () {
      final color = pokemonBgColorFactory('water');
      assert(color == Color(0xFF0085FF));
    },
  );
  test(
    'Validate if pokemonBgColor will return blue color for grass type',
    () {
      final color = pokemonBgColorFactory('grass');
      assert(color == Color(0xFF48D0B0));
    },
  );
}
