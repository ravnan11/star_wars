import 'package:flutter/material.dart';
import 'package:star_wars_project/app/core/models/people.dart';

class DetailAppBarWidget extends StatelessWidget {
  const DetailAppBarWidget(
      {Key? key,
      required this.people,
      required this.onBack,
      required this.isOnTop})
      : super(key: key);
  final People people;
  final VoidCallback onBack;
  final bool isOnTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliverAppBar(
        backgroundColor: Colors.black,
        pinned: true,
        elevation: 0,
        leading: IconButton(
          onPressed: onBack,
          icon: Icon(Icons.chevron_left),
          color: Colors.yellow,
        ),
        centerTitle: false,
        title: AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: isOnTop ? 0 : 1,
          child: Text(
            people.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
