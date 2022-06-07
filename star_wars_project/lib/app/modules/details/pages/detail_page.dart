import 'package:flutter/material.dart';
import 'package:star_wars_project/app/core/models/people.dart';
import 'package:star_wars_project/app/modules/details/pages/widgets/detail_app_bar_widget.dart';

import 'widgets/detail_list_widget.dart';

class DetailPage extends StatefulWidget {
  DetailPage(
      {Key? key,
      required this.people,
      required this.list,
      required this.onBack,
      required this.controller,
      required this.onChangePeople})
      : super(key: key);
  final People people;
  final List<People> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<People> onChangePeople;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  bool isOnTop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener(
      onNotification: (notification) {
        setState(() {
          if (scrollController.position.pixels > 37) {
            isOnTop = false;
          } else if (scrollController.position.pixels <= 36) {
            isOnTop = true;
          }
        });
        return false;
      },
      child: CustomScrollView(
        controller: scrollController,
        physics: ClampingScrollPhysics(),
        slivers: [
          DetailAppBarWidget(
            people: widget.people,
            onBack: widget.onBack,
            isOnTop: isOnTop,
          ),
          DetailListWidget(
            people: widget.people,
            list: widget.list,
            controller: widget.controller,
            onChangePeople: widget.onChangePeople,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                      //color: widget.pokemon.baseColor,
                      ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
