import 'package:assinment/provider/Categories.dart';
import 'package:assinment/provider/TrendingEvents.dart';
import 'package:assinment/provider/Users.dart';
import 'package:assinment/ui/ui.config/App.dart';
import 'package:assinment/ui/widgets/HorizantalCategoryList.dart';
import 'package:assinment/ui/widgets/HorizantalScrolableList.dart';
import 'package:assinment/ui/widgets/UserListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget buildTitleText(String title) {
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(fontSize: 24, color: AppTheme.primaryColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TrendingEvents>(context).list;
    final categoryList = Provider.of<Categories>(context).list;
    final userList = Provider.of<Users>(context).list;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
                style: const TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 8.0, 2.0, 1.0),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.filter_list_sharp),
                    hintText: "Find Events",
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey, width: 22.0),
                        borderRadius: BorderRadius.circular(15.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(15.0)))),
          ),

          buildTitleText('Trending Events'),
          HorizontalListScrollable(list: list),
          Container(
            margin: EdgeInsets.fromLTRB(8, 12, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTitleText(
                  'Category',),
                TextButton(onPressed: () {}, child: Text('See all(${categoryList.length})'))
              ],
            ),
          ),

          HorizontalCategoryList(list: categoryList,),
          Divider(),
          Container(
            margin: EdgeInsets.fromLTRB(8, 12, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTitleText(
                  'My Network',),
                FlatButton(onPressed: () {}, child: Text('See all(${userList.length})'))
              ],
            ),
          ),

          UserListView(list: userList),

        ],
      ),
    );
  }
}
