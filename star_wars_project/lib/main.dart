import 'dart:io';

import 'package:flutter/material.dart';
import 'package:star_wars_project/app/core/repositories/peoples_repository.dart';
import 'package:star_wars_project/app/modules/home/container/home_container.dart';
import 'package:star_wars_project/app/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Star Wars',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: StarWarsRoute(
        repository: PeoplesRepositoryImp(
          httpClient: HttpClient(),
        ),
      ),
    );
  }
}
