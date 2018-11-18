import 'package:flutter/material.dart';

import 'package:ruesy/round_icon_button.dart';

class CardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('cards!'),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildAppBar() {
    return new AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: new IconButton(
        icon: new Icon(
          Icons.person,
          color: Colors.grey,
          size: 40.0,
        ),
        onPressed: () {
          // TODO:
        },
      ),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(
            Icons.chat_bubble,
            color: Colors.grey,
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
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0.0,
      child: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            new RoundIconButton.large(
              icon: Icons.clear,
              iconColor: Colors.red,
              onPressed: () {},
            ),
            new RoundIconButton.large(
              icon: Icons.favorite,
              iconColor: Colors.green,
              onPressed: () {},
            ),
            new RoundIconButton.large(
              icon: Icons.check,
              iconColor: Colors.purple,
              onPressed: () {
                // TODO:
              },
            ),
          ],
        ),
      ),
    );
  }
}
