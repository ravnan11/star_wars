import 'package:flutter/material.dart';
import 'package:star_wars_project/app/core/error/failure.dart';
import 'package:star_wars_project/app/core/models/people.dart';
import 'package:star_wars_project/app/core/repositories/peoples_repository.dart';
import 'package:star_wars_project/app/modules/home/pages/home_loading.dart';
import 'package:star_wars_project/app/modules/home/pages/home_page.dart';

import '../pages/home_error.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repository}) : super(key: key);
  final IPeoplesRepository repository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<People>>(
      future: repository.getAllPeoples(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return HomeLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(
            listPeople: snapshot.data!,
          );
        }

        if (snapshot.hasError) {
          return HomeError(
            error: (snapshot.error as Failure).message!,
          );
        }

        return Container();
      },
    );
  }
}
