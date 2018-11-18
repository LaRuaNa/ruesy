import 'package:flutter/material.dart';

import 'package:ruesy/components/round_icon_button.dart';

class CardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: Text('cards!'),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildAppBar(context) {
    return new AppBar(
        backgroundColor: Colors.white,
        elevation: 2.0,
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back_ios,
            color: Colors.pink,
            size: 30.0,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ));
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
