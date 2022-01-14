import 'package:assinment/model/Category.dart';
import 'package:assinment/model/User.dart';
import 'package:assinment/ui/ui.config/sizeConfig.dart';
import 'package:assinment/ui/widgets/categoryItem.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';


class UserListView extends StatelessWidget {
  const UserListView({Key? key, required this.list}) : super(key: key);
  final List<User> list;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 68,
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
                child:  CircularProfileAvatar(
                  e.imageUrl, //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                  radius: 30, // sets radius, default 50.0
                  backgroundColor: Colors.transparent, // sets background color, default Colors.white
                  borderWidth: 2,  // sets border, default 0.0
                  borderColor: Colors.white, // sets border color, default Colors.white
                  elevation: 5.0, // sets elevation (shadow of the profile picture), default value is 0.0
                  cacheImage: true, // allow widget to cache image against provided url
                  imageFit: BoxFit.cover,
                  onTap: () {
                  }, // sets on tap
                  showInitialTextAbovePicture: true, // setting it true will show initials text above profile picture, default false
                ),
              ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
