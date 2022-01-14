import 'package:assinment/model/Category.dart';
import 'package:assinment/model/TtrendingEvent.dart';
import 'package:assinment/model/User.dart';
import 'package:flutter/material.dart';

class Categories with ChangeNotifier {
  final List<Category> _list = [
    Category(
      name: "MeetUp",
      id: 1,
      imageUrl: 'https://www.bizencyclopedia.com/admin/assets/img/blog/premiumforrestaurants_0.jpg',
    ),
    Category(
      name: "College",
      id: 1,
      imageUrl: 'https://b.zmtcdn.com/data/pictures/5/96745/526620e569bfc5d49c14066db36cfb0e.jpg',
    ),
    Category(
      name: "StartUp",
      id: 2,
      imageUrl: 'https://www.bizencyclopedia.com/admin/assets/img/blog/premiumforrestaurants_0.jpg',
    )
  ];

  Category findEventById(int id) {
    return _list.firstWhere((element) => element.id == id);
  }

  List<Category> get list {
    return [..._list];
  }
}
