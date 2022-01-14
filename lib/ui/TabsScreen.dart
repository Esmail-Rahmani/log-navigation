import 'package:assinment/ui/ui.config/App.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List<Widget> _pages = [
     const HomeScreen(),
     const HomeScreen(),
     const HomeScreen(),
     const HomeScreen(),
     const HomeScreen(),
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: (_pages[_selectedPageIndex]),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'action',
        child: const Icon(Icons.add ,),
        elevation: 4.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _selectPage,
        unselectedItemColor: Colors.black,
        selectedItemColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),


          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle , color: Colors.transparent,),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert_outlined),
            title: Text('Favorites'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Messages'),
          )
        ],
      ),
    );
  }
}
