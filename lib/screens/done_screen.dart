import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildWordCard(),
        _buildWordCard(),
        _buildWordCard(),
        _buildWordCard(),
        _buildWordCard(),
        _buildWordCard(),
        _buildWordCard(),
        _buildWordCard(),
        _buildWordCard(),
        _buildWordCard(),
        _buildWordCard(),
      ],
    );
  }

  Widget _buildWordCard() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text('Говно', textAlign: TextAlign.start),
                ),
                Expanded(
                  child: Text('Shite', textAlign: TextAlign.end),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
