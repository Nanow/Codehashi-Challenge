import 'package:flutter/material.dart';

import 'login_controller_factory.dart';

import '../../../app/pages/pages.dart';

Widget makeLoginPage() => PokemonListPage(
      controller: makeGetxLoginController(),
    );
