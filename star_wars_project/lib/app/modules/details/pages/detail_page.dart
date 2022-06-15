import 'package:flutter/material.dart';
import 'package:star_wars_project/app/core/models/people.dart';
import 'package:star_wars_project/app/modules/details/pages/widgets/detail_app_bar_widget.dart';

import 'widgets/detail_list_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
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
    print('VALOR DO MODEL ATUAL');
    print(widget.people.hairColor);
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
                    color: Colors.white,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Altura: ${widget.people.height}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Massa: ${widget.people.mass}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Gênero Sexual: ${widget.people.gender}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Planeta Natal: ${widget.people.homeworld}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Wiki: ${widget.people.wiki}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Nascido(a): ${widget.people.born}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Local de Nascimento: ${widget.people.bornLocation}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Morreu: ${widget.people.died}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Local da Morte: ${widget.people.diedLocation}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Espécies: ${widget.people.species}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                            visible: (widget.people.hairColor != null)
                                ? true
                                : false,
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    'Cor do Cabelo: ${widget.people.hairColor}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Cor dos Olhos: ${widget.people.eyeColor}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Cor da Pele: ${widget.people.skinColor}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Cibernético(a): ${widget.people.cybernetics}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
