import 'package:assinment/model/TtrendingEvent.dart';
import 'package:flutter/material.dart';

class TrendingEvents with ChangeNotifier {
  final List<TrendingEvent> _list = [
    TrendingEvent(
      name: "Pune Meetup",
      date: DateTime.now(),
      rate: 4.5,
      paid: true,
      distance: 12,
      address: "Bhau Institute, Shivajinagar, Pune",
      followers: [],
      id: 1,
      image: 'https://www.bizencyclopedia.com/admin/assets/img/blog/premiumforrestaurants_0.jpg',
    ),
    TrendingEvent(
      name: "Pune MeetUp",
      date: DateTime.now(),
      rate: 4.5,
      paid: true,
      distance: 12.6,
      address: "address",
      followers: [],
      id: 2,
      image: 'https://www.bizencyclopedia.com/admin/assets/img/blog/premiumforrestaurants_0.jpg',
    )
  ];

  TrendingEvent findEventById(int id) {
    return _list.firstWhere((element) => element.id == id);
  }

  List<TrendingEvent> get list {
    return [..._list];
  }
}
