import 'package:flutter/material.dart';
import 'package:star_wars_project/app/core/models/people.dart';
import 'package:star_wars_project/app/modules/details/pages/widgets/detail_item_list_widget.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget(
      {Key? key,
      required this.people,
      required this.list,
      required this.controller,
      required this.onChangePeople})
      : super(key: key);
  final People people;
  final List<People> list;
  final PageController controller;
  final ValueChanged<People> onChangePeople;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      people.name!,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: PageView(
                controller: controller,
                onPageChanged: (index) => onChangePeople(list[index]),
                children: list.map((e) {
                  bool diff = e.name != people.name;
                  return DetailItemListWidget(
                    isDiff: diff,
                    people: e,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
