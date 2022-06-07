import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchPeople(http.Client client) async {
  final url = Uri.parse('https://swapi.dev/api/people/');
  final response = await http.get(url);
  final data = json.decode(response.body);
  return data['results'];
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder<List<dynamic>>(
          future: fetchPeople(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? PeopleList(people: snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }
}

class PeopleList extends StatelessWidget {
  final dynamic people;

  const PeopleList({Key? key, required this.people}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) {
        return Text(people[index]['name']);
      },
    );
  }
}
