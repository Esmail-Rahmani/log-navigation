import 'package:assinment/model/TtrendingEvent.dart';
import 'package:assinment/model/User.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  final List<User> _list = [
    User(
      name: "name",
      id: 5,
      imageUrl: 'https://www.headshotsprague.com/wp-content/uploads/2019/08/Emotional-headshot-of-aspiring-actress-on-white-background-made-by-Headshots-Prague-1.jpg',
    ),
    User(
      name: "name",
      id: 6,
      imageUrl: 'https://st.depositphotos.com/2309453/3120/i/950/depositphotos_31203671-stock-photo-friendly-smiling-man.jpg',
    ),
    User (
      name: "good Events",
      id: 7,
      imageUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    ),
    User(
      name: "name",
      id: 1,
      imageUrl: 'https://www.bizencyclopedia.com/admin/assets/img/blog/premiumforrestaurants_0.jpg',
    ),
    User(
      name: "name",
      id: 2,
      imageUrl: 'https://www.bizencyclopedia.com/admin/assets/img/blog/premiumforrestaurants_0.jpg',
    ),
    User(
      name: "name",
      id: 3,
      imageUrl: 'https://www.bizencyclopedia.com/admin/assets/img/blog/premiumforrestaurants_0.jpg',
    ),
    User(
      name: "name",
      id: 4,
      imageUrl: 'https://www.bizencyclopedia.com/admin/assets/img/blog/premiumforrestaurants_0.jpg',
    ),

  ];

  User findEventById(int id) {
    return _list.firstWhere((element) => element.id == id);
  }

  List<User> get list {
    return [..._list];
  }
}
