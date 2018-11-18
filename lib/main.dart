import 'package:flutter/material.dart';

import 'package:ruesy/profile_screen.dart';
import 'package:ruesy/card_screen.dart';
import 'package:ruesy/round_icon_button.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruesy',
      theme: new ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => Home(),
        '/card': (BuildContext context) => CardScreen(),
      },
    );
  }
}

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
            PageOne(),
            Container(
                color: Colors.yellow, child: Center(child: Text('Page 2'))),
            Container(
                color: Colors.green, child: Center(child: Text('Page 3'))),
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
            // TODO:
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
          // currentPageIndex = index;
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

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      color: Colors.deepPurple,
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      color: Colors.green,
    );
  }
}
