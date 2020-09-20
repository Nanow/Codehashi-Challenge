import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_flutter/data/helpers/helpers.dart';

main() {
  test(
    'Validate if pokemonBgColor will return red color for fire type',
    () {
      final color = pokemonBgColor('fire');
      assert(color == Colors.red);
    },
  );
  test(
    'Validate if pokemonBgColor will return blue color for water type',
    () {
      final color = pokemonBgColor('water');
      assert(color == Colors.blue);
    },
  );
  test(
    'Validate if pokemonBgColor will return blue color for grass type',
    () {
      final color = pokemonBgColor('grass');
      assert(color == Colors.green);
    },
  );
}
