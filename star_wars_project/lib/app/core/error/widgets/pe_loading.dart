import 'package:flutter/material.dart';

class PeLoading extends StatelessWidget {
  const PeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
