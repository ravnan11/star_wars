import 'package:flutter/material.dart';
import 'package:star_wars_project/app/core/models/people.dart';

class DetailItemListWidget extends StatelessWidget {
  const DetailItemListWidget(
      {Key? key, required this.isDiff, required this.people})
      : super(key: key);
  final bool isDiff;
  final People people;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: isDiff ? 0.4 : 1.0,
        //hild: TweenAnimationBuilder<double>(
        //duration: Duration(milliseconds: 200),
        //curve: Curves.easeIn,
        //tween: Tween<double>(
        //  end: isDiff ? 100 : 300, begin: isDiff ? 300 : 100),
        //builder: (context, value, child) {
        //return Image.network(
        //people.image,
        //width: value,
        //fit: BoxFit.contain,
        //color: isDiff ? Colors.black.withOpacity(0.4) : null,
        //);
        // })),
      ),
    );
  }
}
