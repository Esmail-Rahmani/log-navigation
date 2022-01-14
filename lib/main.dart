import 'package:assinment/provider/Categories.dart';
import 'package:assinment/provider/LogProvider.dart';
import 'package:assinment/provider/TrendingEvents.dart';
import 'package:assinment/provider/Users.dart';
import 'package:assinment/routes.dart';
import 'package:assinment/ui/ui.config/App.dart';
import 'package:assinment/ui/ui.config/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Assignment(title: 'Flutter Demo Home Page'),
    );
  }
}

class Assignment extends StatefulWidget {
  const Assignment({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Assignment> createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints)
    {
      return OrientationBuilder(
        builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<LogController>.value(
                  value: LogController()),
              ChangeNotifierProvider(create: (ctx)=> TrendingEvents()),
              ChangeNotifierProvider(create: (ctx)=> Users()),
              ChangeNotifierProvider(create: (ctx)=> Categories()),

            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              color: Colors.white,
              routes: routes,
              initialRoute: Routes.loginPage,
              title: 'Assignment',
              theme: ThemeData(
                // Define the default brightness and colors.
                // brightness: Brightness.dark,
                primaryColor: Color(0xff5663ff),
                accentColor: Color(0xff5663ff),
                unselectedWidgetColor: AppTheme.secondaryColor,
                // Define the default font family.
                fontFamily: 'Nunito-Regular',

                // Define the default `TextTheme`. Use this to specify the default
                // text styling for headlines, titles, bodies of text, and more.
                textTheme: const TextTheme(
                  headline1:
                  TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      );
    });
    }
  }

