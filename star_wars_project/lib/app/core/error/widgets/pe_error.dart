import 'package:flutter/material.dart';

class PeError extends StatelessWidget {
  const PeError({Key? key, this.error}) : super(key: key);
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error ?? 'Erro durante a operação'),
      ),
    );
  }
}
