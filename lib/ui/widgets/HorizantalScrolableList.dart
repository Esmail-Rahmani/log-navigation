import 'package:assinment/model/TtrendingEvent.dart';
import 'package:assinment/provider/TrendingEvents.dart';
import 'package:assinment/ui/ui.config/sizeConfig.dart';
import 'package:flutter/material.dart';

import 'TrendingEventItem.dart';

class HorizontalListScrollable extends StatelessWidget {
  const HorizontalListScrollable({Key? key, required this.list}) : super(key: key);
  final List<TrendingEvent> list;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: SizeConfig.screenWidth * 0.8,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: list
                  .map((e) => Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8.0),
                child: TrendingEventItem( event: e,),
              ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
