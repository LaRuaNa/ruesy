import 'package:flutter/material.dart';

import 'package:ruesy/screens/profile_screen.dart';
import 'package:ruesy/screens/favourite_screen.dart';
import 'package:ruesy/screens/list_screen.dart';
import 'package:ruesy/screens/done_screen.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  final PageController pageController = new PageController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: _buildAppBar(),
        body: new PageView(
          children: <Widget>[
            ProfileScreen(),
            FavouriteScreen(),
            ListScreen(),
            DoneScreen(),
          ],
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: _buildBottomBar());
  }

  Widget _buildAppBar() {
    return new AppBar(
      backgroundColor: Colors.white,
      elevation: 2.0,
      automaticallyImplyLeading: false,
      title: Text(
        'Ruesy',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink),
      ),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(
            Icons.play_arrow,
            color: Colors.pink,
            size: 40.0,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/card');
          },
        )
      ],
    );
  }

  Widget _buildBottomBar() {
    final navigationItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Profile")),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite), title: Text("Favourite")),
      BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("List")),
      BottomNavigationBarItem(
          icon: Icon(Icons.playlist_add_check), title: Text("Done")),
    ];

    return BottomNavigationBar(
      currentIndex: currentPageIndex,
      items: navigationItems,
      onTap: (index) {
        setState(() {
          pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        });
      },
      fixedColor: Colors.pink,
      iconSize: 25.0,
      type: BottomNavigationBarType.fixed,
    );
  }

  void onPageChanged(index) {
    setState(() {
      currentPageIndex = index;
    });
  }
}
