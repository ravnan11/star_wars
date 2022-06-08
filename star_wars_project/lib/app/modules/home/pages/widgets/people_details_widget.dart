import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:star_wars_project/app/core/models/people.dart';
import 'package:star_wars_project/app/modules/details/container/detail_container.dart';

class PeopleDetailsWidget extends StatelessWidget {
  const PeopleDetailsWidget(
      {Key? key,
      required this.people,
      required this.index,
      required this.onTap})
      : super(key: key);
  final Function(String, DetailArguments) onTap;
  final People people;
  final int index;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () =>
          onTap('/details', DetailArguments(people: people, index: index)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF0E3311).withOpacity(0.5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: CachedNetworkImage(
                      imageUrl: people.image,
                      width: size.width * .60,
                      height: size.width * .60,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 80,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nome: ${people.name}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Text(
                        'ID:#${people.id}',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
