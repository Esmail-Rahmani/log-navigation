
import 'package:assinment/model/Category.dart';
import 'package:assinment/ui/ui.config/sizeConfig.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: SizeConfig.screenWidth*0.3,
         width: SizeConfig.screenWidth*0.3,
         child: CircularProfileAvatar(
            category.imageUrl, //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
            radius: 5, // sets radius, default 50.0
            backgroundColor: Colors.transparent, // sets background color, default Colors.white
            borderWidth: 1,  // sets border, default 0.0
            initialsText: Text(
              category.name,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),  // sets initials text, set your own style, default Text('')
            borderColor: Colors.transparent, // sets border color, default Colors.white
            elevation: 5.0, // sets elevation (shadow of the profile picture), default value is 0.0
            foregroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.6), //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
            cacheImage: true, // allow widget to cache image against provided url
            onTap: () {
              // print('adil');
            }, // sets on tap
            showInitialTextAbovePicture: true, // setting it true will show initials text above profile picture, default false

      )
      )

    );
  }
}
