import 'package:assinment/ScreenArguments.dart';
import 'package:assinment/constant/constants.dart';
import 'package:assinment/provider/LogProvider.dart';
import 'package:assinment/ui/ui.config/App.dart';
import 'package:assinment/ui/ui.config/sizeConfig.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../routes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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


                      SizedBox(height:  SizeConfig.screenHeight*0.1),
                       SizedBox(
                        child: CircleAvatar(
                          radius: 70.0,
                          backgroundColor: Colors.black45,
                          child: CircleAvatar(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                backgroundColor: Theme.of(context).primaryColor,
                                radius: 18.0,
                                child: const Icon(
                                  Icons.arrow_upward  ,
                                  size: 25.0,
                                  color:Colors.white,
                                ),
                              ),
                            ),
                            radius: 68.0,
                            backgroundImage: AssetImage('assets/img.png'),
                            backgroundColor: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height:  SizeConfig.screenHeight*0.05),

                      Input(
                        controller: log.name,
                        title: 'Name',
                        bgColor: const Color.fromARGB(255, 169, 193, 208),
                        iconColor:  Theme.of(context).primaryColor,
                        textColor: Theme.of(context).primaryColor,
                        icon: Icons.person,

                      ),
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
                      Input(
                        controller: log.confirmPassword,
                        icon: Icons.lock_outline,
                        bgColor: const Color.fromARGB(255, 169, 193, 208),
                        iconColor: Colors.white,
                        textColor: Theme.of(context).primaryColor,
                        title: 'Confirm Password',
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.05,
                      ),
                      PrimaryButton(
                        title: "Register",
                        padding: const EdgeInsets.all(20),
                        color: Theme.of(context).primaryColor,
                        buttonRadius: borderRadius(radius: 10),
                        titleStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
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
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.06,
                      ),
                      GestureDetector(
                        onTap: (){
                          pop(context);
                        },
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(text: 'Already Have an Account? '),
                                TextSpan(
                                  text: 'Login',
                                  style: TextStyle(fontWeight: FontWeight.bold , color: Theme.of(context).primaryColor),
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
