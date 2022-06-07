import 'dart:convert';
import 'dart:io';
import 'package:star_wars_project/app/core/data/endpoints/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars_project/app/core/error/failure.dart';
import 'package:star_wars_project/app/core/models/people.dart';

abstract class IPeoplesRepository {
  Future<List<People>> getAllPeoples();
}

class PeoplesRepositoryImp implements IPeoplesRepository {
  final HttpClient httpClient;

  PeoplesRepositoryImp({required this.httpClient});

  @override
  Future<List<People>> getAllPeoples() async {
    try {
      List<People> listPeople = [];
      final url = Uri.parse(EndPoints.apiPeoples);
      final response = await http.get(url);
      final data = json.decode(response.body);
      for (var i = 0; i < data['results'].length; i++) {
        listPeople.add(People.fromJson(data['results'][i]));
      }
      return listPeople;
    } catch (e) {
      throw Failure(message: 'Não foi possível carregar os dados');
    }
  }
}
