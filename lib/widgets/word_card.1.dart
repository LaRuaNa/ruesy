import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:ruesy/card_status.dart';
import 'package:ruesy/widgets/icon_label_button.dart';
import 'package:ruesy/widgets/pronunciation_button.dart';

class WordCard extends StatefulWidget {
  final CardStatus cardStatus;

  WordCard({
    this.cardStatus,
  });

  @override
  WordCardState createState() {
    return new WordCardState();
  }
}

class WordCardState extends State<WordCard> with TickerProviderStateMixin {
  static final Animatable<Offset> _slideLeftTween = Tween<Offset>(
    begin: const Offset(0.0, 0.0),
    end: const Offset(-1.0, 0.0),
  ).chain(CurveTween(
    curve: Curves.fastOutSlowIn,
  ));
  AnimationController _controller;
  Animation<Offset> _drawerDetailsPosition;
  Decision decision;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _drawerDetailsPosition = _controller.drive(_slideLeftTween);
    widget.cardStatus.addListener(_onCardStatusChange);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _controller.forward();
    return Column(children: [
      SlideTransition(
          position: _drawerDetailsPosition,
          child: Container(
            color: Colors.pink,
            height: 100.0,
            width: 100.0,
          )),
      RaisedButton(
        onPressed: () => _controller.forward(),
        child: Text('up'),
      ),
      RaisedButton(
        onPressed: () => _controller.reverse(),
        child: Text('down'),
      )
    ]);
    return Container(
      padding: EdgeInsets.all(25.0),
      child: FlipCard(
          direction: FlipDirection.HORIZONTAL, // default
          front: _buildFrontCard(),
          back: _buildBackCard()),
    );
  }

  Widget _buildFrontCard() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 3.0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  'Говно',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: PronunciationButton(
                  icon: Icons.volume_up,
                  iconColor: Colors.pink,
                  text: 'gavno',
                  onPressed: () {
                    print('hier geht doch ');
                  },
                ),
              ),
              Text('Shite'),
            ],
          ),
        ),
        Positioned(
          right: 20,
          bottom: 30,
          left: 20,
          child: LinearProgressIndicator(
            value: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildBackCard() {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Column(
              children: <Widget>[
                Text('Иди́ на рабо́ту, чи́стить говно́. — Хуй тебе!'),
                Text(
                  'Go to work, scour the shit. - Screw you!',
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onCardStatusChange() {
    if (widget.cardStatus.decision != decision) {
      switch (widget.cardStatus.decision) {
        case Decision.unknown:
          _slideLeft();
          break;
        default:
      }
    }
  }

  void _slideLeft() {
    _controller.forward();
  }
}
