import 'package:flutter/material.dart';
import 'package:ruesy/card_status.dart';

import 'package:ruesy/widgets/round_icon_button.dart';
import 'package:ruesy/widgets/word_card.dart';

class CardScreen extends StatefulWidget {
  CardScreen({Key key}) : super(key: key);
  @override
  _CardScreenState createState() => new _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  CardStatus _currentCardStatus = new CardStatus();
  void initState() {
    super.initState();
    _currentCardStatus.addListener(_onCardStatusChange);
  }

  @override
  void dispose() {
    _currentCardStatus.removeListener(_onCardStatusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: Container(
          child: WordCard(cardStatus: _currentCardStatus),
        ),
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
              onPressed: () => _currentCardStatus.setUnknown(),
            ),
            new RoundIconButton.large(
              icon: Icons.favorite,
              iconColor: Colors.green,
              onPressed: () => _currentCardStatus.setFavourite(),
            ),
            new RoundIconButton.large(
              icon: Icons.check,
              iconColor: Colors.purple,
              onPressed: () => _currentCardStatus.setKnown(),
            ),
          ],
        ),
      ),
    );
  }

  void _onCardStatusChange() {
    if (_currentCardStatus != null) {
      _currentCardStatus.removeListener(_onCardStatusChange);
    }
  }
}
