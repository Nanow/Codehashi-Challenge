import 'package:pokedex_flutter/controllers/getx_list_controller.dart';

import './list_repository_factory.dart';

GetxListController makeGetxLoginController() => GetxListController(
      repository: localPokemonRepositoryFactory(),
    );
