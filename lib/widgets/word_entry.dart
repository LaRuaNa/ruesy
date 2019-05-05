import 'package:flutter/material.dart';

class WordEntry extends StatelessWidget {
  final bool isProgress;
  const WordEntry({
    Key key,
    this.isProgress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: RawMaterialButton(
        onPressed: () => {},
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
              _buildProgressBar(),
            ],
          ),
        ),
      ),
    );
  }

  _buildProgressBar() {
    return Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: LinearProgressIndicator(
          value: 0.5,
        ));
  }
}
