import 'package:assinment/constant/constants.dart';
import 'package:assinment/provider/LogProvider.dart';
import 'package:assinment/ui/ui.config/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    final log = Provider.of<LogController>(context);

    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0.9],
          colors: [
            Theme.of(context).primaryColor,
            Color.fromARGB(255, 23, 50, 239),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color(0x00000000),
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () { Navigator.pop(context); },
        ),

        title: const Text(
          "ForgetPassword",
          style: TextStyle(
              fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.12,
              ),
              const Text(
                "Enter your email and we will send you instructions on how to reset it",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.03,
              ),
              Input(
                controller: log.email,
                bgColor: Theme.of(context).primaryColor,
                title: 'Email',
                icon: Icons.email_outlined,
                iconColor: Colors.white70,
                textColor: Colors.white70,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.42,
              ),
              Center(
                child: PrimaryButton(
                  contentPadding: const EdgeInsets.all(10),
                  height: 65,
                  title: "Send",
                  width: SizeConfig.screenWidth * 0.8,
                  onTap: () {
                    // log.validateForgotPassword(context);
                    // push(context, Routes.landingPage);
                  },
                  color: Colors.white70,
                  padding: const EdgeInsets.all(12),
                  titleStyle:  TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
                  buttonRadius: borderRadius(radius: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    ),);
  }
}
