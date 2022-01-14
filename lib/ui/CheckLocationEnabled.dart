import 'package:android_intent/android_intent.dart';
import 'package:assinment/ScreenArguments.dart';
import 'package:assinment/constant/constants.dart';
import 'package:assinment/provider/LogProvider.dart';
import 'package:assinment/ui/ui.config/App.dart';
import 'package:assinment/ui/ui.config/sizeConfig.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../../routes.dart';

class CheckLocationEnabled extends StatefulWidget {
  const CheckLocationEnabled({Key? key}) : super(key: key);

  @override
  State<CheckLocationEnabled> createState() => _CheckLocationEnabledState();
}

class _CheckLocationEnabledState extends State<CheckLocationEnabled> {
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  Future _checkGps() async {
    if (!(await _geolocatorPlatform.isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Can't get gurrent location"),
              content:
              const Text('Please make sure you enable GPS and try again'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    const AndroidIntent intent = AndroidIntent(
                        action: 'android.settings.LOCATION_SOURCE_SETTINGS');

                    intent.launch();
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
    else{
      push(context, Routes.tabScreen, screenArguments: ScreenArguments(stringValue: ''));
    }
  }
  @override
  Widget build(BuildContext context) {
    final log = Provider.of<LogController>(context);
    return WillPopScope(
      onWillPop: () {
        closeApp(context);
        return Future<bool>(() {
          return true;
        });
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.25,
                      ),
                      Text("Hi Jet,\nWelcome to\nGatharr!", style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),),
                      SizedBox(height:  SizeConfig.screenHeight*0.1),

                      Text("Please turn on your GPS to find out better events suggestions near you.", style: TextStyle(
                        fontSize: 24,
                        color: Theme.of(context).primaryColor,
                      ),),
                      SizedBox(height:  SizeConfig.screenHeight*0.13),

                      PrimaryButton(
                        title: "Turn On GPS",
                        padding: EdgeInsets.all(20),
                        color: Theme.of(context).primaryColor,
                        buttonRadius: borderRadius(radius: 10),
                        titleStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        onTap: () {
                          _checkGps();
                        },
                        contentPadding: const EdgeInsets.all(10),
                        height: 70,
                        width: SizeConfig.screenWidth * 0.85,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
