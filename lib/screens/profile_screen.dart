import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [_buildAvatar(), _buildVocabularyCounter()],
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
}
