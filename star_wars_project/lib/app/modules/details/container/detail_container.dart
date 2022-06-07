import 'package:flutter/material.dart';
import 'package:star_wars_project/app/core/error/failure.dart';
import 'package:star_wars_project/app/core/error/widgets/pe_error.dart';
import 'package:star_wars_project/app/core/error/widgets/pe_loading.dart';
import 'package:star_wars_project/app/core/models/people.dart';
import 'package:star_wars_project/app/core/repositories/peoples_repository.dart';
import 'package:star_wars_project/app/modules/details/pages/detail_page.dart';

class DetailArguments {
  DetailArguments({this.index = 0, required this.people});
  final People people;
  final int? index;
}

class DetailContainer extends StatefulWidget {
  const DetailContainer(
      {Key? key,
      required this.repository,
      required this.arguments,
      required this.onBack})
      : super(key: key);
  final PeoplesRepositoryImp repository;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  _DetailContainerState createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  late PageController _controller;
  late Future<List<People>> _future;
  People? _people;
  @override
  void initState() {
    _controller = PageController(
        viewportFraction: 0.5, initialPage: widget.arguments.index!);
    _future = widget.repository.getAllPeoples();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<People>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return PeLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          // ignore: prefer_conditional_assignment
          if (_people == null) {
            _people = widget.arguments.people;
          }
          return DetailPage(
            people: _people!,
            list: snapshot.data!,
            onBack: widget.onBack,
            controller: _controller,
            onChangePeople: (People value) {
              setState(() {
                _people = value;
              });
            },
          );
        }

        if (snapshot.hasError) {
          return PeError(
            error: (snapshot.error as Failure).message!,
          );
        }

        return Container();
      },
    );
  }
}
