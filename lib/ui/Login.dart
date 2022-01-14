import 'package:assinment/ScreenArguments.dart';
import 'package:assinment/constant/constants.dart';
import 'package:assinment/provider/LogProvider.dart';
import 'package:assinment/ui/ui.config/App.dart';
import 'package:assinment/ui/ui.config/sizeConfig.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  padding: const EdgeInsets.only(top: 0, bottom: 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.15,
                      ),
                      Text(
                        "Gathrr",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.3),
                      Input(
                        controller: log.email,
                        title: 'Email',
                        bgColor: const Color.fromARGB(255, 169, 193, 208),
                        iconColor: Colors.white,
                        textColor: Theme.of(context).primaryColor,
                        icon: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: 3 * SizeConfig.heightMultiplier,
                      ),
                      Input(
                        controller: log.password,
                        icon: Icons.lock_outline,
                        bgColor: const Color.fromARGB(255, 169, 193, 208),
                        iconColor: Colors.white,
                        textColor: Theme.of(context).primaryColor,
                        title: 'Password',
                      ),
                      GestureDetector(
                        onTap: () {
                          push(context, Routes.forgotPassword,
                              screenArguments:
                                  ScreenArguments(stringValue: ''));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Forget Password?',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.1,
                      ),
                      PrimaryButton(
                        title: "Login",
                        padding: EdgeInsets.all(20),
                        color: Theme.of(context).primaryColor,
                        buttonRadius: borderRadius(radius: 10),
                        titleStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        onTap: () {
                          // log.getIp();
                          // log.validateSignInData(context);
                          push(
                            context,
                            Routes.locationEnabled,
                            screenArguments: ScreenArguments(
                              stringValue: '',
                            ),
                          );
                        },
                        contentPadding: const EdgeInsets.all(10),
                        height: 70,
                        width: SizeConfig.screenWidth * 0.85,
                      ),
                      GestureDetector(
                        onTap: () {
                          push(context, Routes.signUp,
                              screenArguments:
                                  ScreenArguments(stringValue: ''));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                    text: 'Dosen\'t Have an Account? '),
                                TextSpan(
                                  text: 'SignUp',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
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
