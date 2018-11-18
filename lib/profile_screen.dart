import 'package:flutter/material.dart';

import 'package:ruesy/round_icon_button.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Profile")),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite), title: Text("Favourite")),
      BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("List")),
      BottomNavigationBarItem(
          icon: Icon(Icons.playlist_add_check), title: Text("Done")),
    ];

    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        children: [_buildAvatar(), _buildVocabularyCounter()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: navigationItems,
        onTap: (index) {},
        fixedColor: Colors.pink,
        iconSize: 25.0,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildAvatar() {
    return Row(
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          padding: EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundImage: new AssetImage("assets/image.png"),
          ),
        ),
        Row(
          children: [
            Text(
              'Sepp',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVocabularyCounter() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              height: 80.0,
              color: Colors.pink,
              child: Text('123 Mins'),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              height: 80.0,
              color: Colors.red,
              child: Text('1234 Words'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return new AppBar(
      title: Text(
        'Ruesy',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
