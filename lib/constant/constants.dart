import 'dart:math';

import 'package:assinment/provider/LogProvider.dart';
import 'package:assinment/ui/ui.config/App.dart';
import 'package:assinment/ui/ui.config/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../ScreenArguments.dart';
import '../routes.dart';

screenArguments(context) => ModalRoute.of(context)?.settings.arguments;

String simplifyDate(DateTime date, {bool disableTime = false}) {
  var formatter =
      disableTime ? DateFormat('dd MMMM y') : DateFormat('dd MMMM y – kk:mm');
  //var formatter = new DateFormat("yMMMMEEEEd");
  String formatted = formatter.format(date);
  return formatted;
}

responsiveWidth() {
  return SizeConfig.isPortrait
      ? SizeConfig.screenWidth
      : SizeConfig.screenHeight;
}

responsiveHeight({required double heightInPercent}) {
  return SizeConfig.isPortrait
      ? heightInPercent * SizeConfig.heightMultiplier
      : (heightInPercent * 3) * SizeConfig.screenWidth / 100;
}

push(context, route, {required ScreenArguments screenArguments}) {
  Navigator.pushNamed(context, route, arguments: screenArguments);
}

pop(context) {
  Navigator.pop(context);
}

trimString(String text, {required int length}) {
  final trimLength = length;
  if (text.length >= trimLength) {
    return "${text.substring(0, trimLength)}...";
  } else {
    return text;
  }
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

String dummyImage =
    'https://pbs.twimg.com/media/EtIXISCWMAUC06a?format=jpg&name=900x900';

popUntil(context, route) {
  Navigator.popUntil(context, ModalRoute.withName(route));
}

borderRadius({required double radius}) {
  return BorderRadius.all(Radius.circular(radius));
}

borderRadiusOn(
    {double topRight = 0,
    double topLeft = 0,
    double bottomLeft = 0,
    double bottomRight = 0}) {
  return BorderRadius.only(
      bottomRight: Radius.circular(bottomRight),
      bottomLeft: Radius.circular(bottomLeft),
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight));
}

delay(int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
}

final outlineBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
    borderRadius: BorderRadius.circular(30.0));

class Bullet extends StatelessWidget {
  const Bullet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: 6,
      decoration: const BoxDecoration(
        color: Color(0xcce4683a),
        shape: BoxShape.circle,
      ),
    );
  }
}

closeApp(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Do you really want to exit app?',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
            FlatButton(
              child: Text('No'),
              onPressed: () {
                pop(context);
              },
            ),
          ],
        );
      });
}

logoutPopUp(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Do you want log out from app?',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                pop(context);
                Provider.of<LogController>(context, listen: false)
                    .clearTextControllers();
                push(context, Routes.loginPage,
                    screenArguments: ScreenArguments(stringValue: ''));
              },
            ),
            FlatButton(
              child: Text('No'),
              onPressed: () {
                pop(context);
              },
            ),
          ],
        );
      });
}

class PrimaryButton extends StatelessWidget {
  final EdgeInsets padding;
  final String title;
  final Color color;
  final double width;
  final double height;
  final VoidCallback onTap;
  final TextStyle titleStyle;
  final EdgeInsets contentPadding;
  final BorderRadius buttonRadius;

  const PrimaryButton(
      {Key? key,
      required this.padding,
      required this.title,
      required this.color,
      required this.width,
      required this.height,
      required this.onTap,
      required this.titleStyle,
      required this.contentPadding,
      required this.buttonRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Material(
        borderRadius: buttonRadius ,
        elevation: 1,
        color: color ,
        child: InkWell(
          borderRadius: buttonRadius ,
          highlightColor: color ,
          splashColor: Colors.black38,
          onTap: onTap,
          child: Center(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: titleStyle ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.controller,
    this.textColor = Colors.black87,
    this.bgColor = Colors.blueGrey,
    this.iconColor = Colors.black87,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final Color textColor;
  final Color bgColor;
  final Color iconColor;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // ignore: deprecated_member_use
      overflow: Overflow.visible,
      children: [
        Material(
          borderRadius: borderRadius(radius: 10),
          shadowColor: Colors.black38,
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 28),
            decoration: BoxDecoration(
              borderRadius: borderRadius(radius: 10),
              color: bgColor,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Icon(
                    icon,
                    size: 28,
                    color: iconColor,
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: controller,
                    style: TextStyle(
                      fontSize: 18,
                      color: textColor,
                    ),
                    decoration: InputDecoration(
                        errorStyle: const TextStyle(fontSize: 10),
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.black26,
                        ),
                        hintText: title,
                        enabledBorder: outlineBorder,
                        focusedBorder: outlineBorder,
                        disabledBorder: outlineBorder),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -17,
          right: 20,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: 1,
            child: Text(
              "errorTextValue",
              style: TextStyle(
                color: AppTheme.errorColor,
                fontSize: 1.25 * SizeConfig.heightMultiplier,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Label extends StatelessWidget {
  final String text;
  final Color color;

  Label({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Text(
        text,
        style: AppTheme.labelStyle,
      ),
    );
  }
}

Widget hr() {
  return Container(
    height: 1,
    width: SizeConfig.screenWidth,
    color: Colors.black45,
  );
}
