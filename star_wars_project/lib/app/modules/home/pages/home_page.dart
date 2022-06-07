import 'package:flutter/material.dart';
import 'package:star_wars_project/app/core/models/people.dart';
import 'package:star_wars_project/app/modules/details/container/detail_container.dart';
import 'package:star_wars_project/app/modules/home/pages/widgets/people_details_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.listPeople, required this.onItemTap})
      : super(key: key);
  final List<People> listPeople;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Star Wars',
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: GridView.count(
            crossAxisCount: 1,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: listPeople
                .map((e) => PeopleDetailsWidget(
                      people: e,
                      onTap: onItemTap,
                      index: listPeople.indexOf(e),
                    ))
                .toList()),
      ),
    );
  }
}
