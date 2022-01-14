import 'package:assinment/model/TtrendingEvent.dart';
import 'package:assinment/provider/TrendingEvents.dart';
import 'package:assinment/ui/ui.config/sizeConfig.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrendingEventItem extends StatelessWidget {
  const TrendingEventItem({Key? key, required this.event}) : super(key: key);
  final TrendingEvent event;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => selectAdvocate(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.network(
                    event.image,
                    height: SizeConfig.screenWidth * 0.5,
                    width: SizeConfig.screenWidth * 0.85,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    height: SizeConfig.screenHeight * 0.045,
                    padding: EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.star,
                          ),
                          color: Colors.amber,
                          onPressed: () {},
                        ),
                        Text(
                          "${event.rate}",
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    height: SizeConfig.screenHeight * 0.04,
                    width: SizeConfig.screenHeight * 0.09,
                    padding: EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "30-03",
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 8, 1),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: SizeConfig.screenWidth*0.8,
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            event.name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              event.paid ? 'Paid' : 'unPaid',
                              style: const TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "${event.distance}",
                              style: const TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Spacer(),
                          Align(
                            widthFactor: 0.5,
                            child: CircularProfileAvatar(
                              'https://www.headshotsprague.com/wp-content/uploads/2019/08/Emotional-headshot-of-aspiring-actress-on-white-background-made-by-Headshots-Prague-1.jpg',
                              //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                              radius: 14,
                              // sets radius, default 50.0
                              backgroundColor: Colors.transparent,
                              // sets background color, default Colors.white
                              borderWidth: 2,
                              // sets border, default 0.0
                              // sets initials text, set your own style, default Text('')
                              borderColor: Colors.white,
                              // sets border color, default Colors.white
                              elevation: 5.0,
                              // sets elevation (shadow of the profile picture), default value is 0.0
                              // foregroundColor: Colors.brown.withOpacity(0.5), //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
                              cacheImage: true,
                              // allow widget to cache image against provided url
                              imageFit: BoxFit.cover,
                              onTap: () {
                                // print('adil');
                              },
                              // sets on tap
                              showInitialTextAbovePicture:
                                  true, // setting it true will show initials text above profile picture, default false
                            ),
                          ),
                          Align(
                            widthFactor: 0.5,
                            child: CircularProfileAvatar(
                              'https://st.depositphotos.com/2309453/3120/i/950/depositphotos_31203671-stock-photo-friendly-smiling-man.jpg',
                              //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                              radius: 14,
                              // sets radius, default 50.0
                              backgroundColor: Colors.transparent,
                              // sets background color, default Colors.white
                              borderWidth: 2,
                              // sets border, default 0.0
                              // sets initials text, set your own style, default Text('')
                              borderColor: Colors.white,
                              // sets border color, default Colors.white
                              elevation: 5.0,
                              // sets elevation (shadow of the profile picture), default value is 0.0
                              // foregroundColor: Colors.brown.withOpacity(0.5), //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
                              cacheImage: true,
                              // allow widget to cache image against provided url
                              imageFit: BoxFit.cover,
                              onTap: () {
                                // print('adil');
                              },
                              // sets on tap
                              showInitialTextAbovePicture:
                                  true, // setting it true will show initials text above profile picture, default false
                            ),
                          ),
                          Align(
                            widthFactor: 0.5,
                            child: CircularProfileAvatar(
                              'https://avatars0.githubusercontent.com/u/8264639?s=460&v=4',
                              //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                              radius: 14,
                              // sets radius, default 50.0
                              backgroundColor: Colors.transparent,
                              // sets background color, default Colors.white
                              borderWidth: 2,
                              // sets border, default 0.0
                              // sets initials text, set your own style, default Text('')
                              borderColor: Colors.white,
                              // sets border color, default Colors.white
                              elevation: 5.0,
                              // sets elevation (shadow of the profile picture), default value is 0.0
                              // foregroundColor: Colors.brown.withOpacity(0.5), //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
                              cacheImage: true,
                              // allow widget to cache image against provided url
                              imageFit: BoxFit.cover,
                              onTap: () {
                                // print('adil');
                              },
                              // sets on tap
                              showInitialTextAbovePicture:
                                  true, // setting it true will show initials text above profile picture, default false
                            ),
                          ),
                          Align(
                            widthFactor: 0.5,
                            child: CircularProfileAvatar(
                              'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                              //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                              radius: 14,
                              // sets radius, default 50.0
                              backgroundColor: Colors.transparent,
                              // sets background color, default Colors.white
                              borderWidth: 2,
                              // sets border, default 0.0
                              // sets initials text, set your own style, default Text('')
                              borderColor: Colors.white,
                              // sets border color, default Colors.white
                              elevation: 5.0,
                              initialsText: const Text(
                                "4+",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              // sets elevation (shadow of the profile picture), default value is 0.0
                              // foregroundColor: Colors.brown.withOpacity(0.5), //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
                              cacheImage: true,
                              // allow widget to cache image against provided url
                              imageFit: BoxFit.cover,
                              onTap: () {
                                // print('adil');
                              },
                              // sets on tap
                              showInitialTextAbovePicture:
                                  true, // setting it true will show initials text above profile picture, default false
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      event.address,
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
