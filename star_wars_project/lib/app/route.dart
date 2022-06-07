import 'package:flutter/material.dart';
import 'package:star_wars_project/app/core/repositories/peoples_repository.dart';

import 'modules/details/container/detail_container.dart';
import 'modules/home/container/home_container.dart';

class StarWarsRoute extends StatelessWidget {
  const StarWarsRoute({Key? key, required this.repository}) : super(key: key);
  final PeoplesRepositoryImp repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              return HomeContainer(
                repository: repository,
                onItemTap: (route, arguments) {
                  Navigator.of(context).pushNamed(route, arguments: arguments);
                },
              );
            },
          );
        }

        if (settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) {
              return DetailContainer(
                repository: repository,
                arguments: (settings.arguments as DetailArguments),
                onBack: () => Navigator.of(context).pop(),
              );
            },
          );
        }
      },
    );
  }
}
