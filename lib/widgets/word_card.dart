import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:ruesy/card_status.dart';
import 'package:ruesy/widgets/icon_label_button.dart';

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
  Decision decision;
  Offset cardOffset = const Offset(0.0, 0.0);
  Tween<Offset> slideOutTween;
  AnimationController slideOutAnimation;

  @override
  void initState() {
    super.initState();
    widget.cardStatus.addListener(_onCardStatusChange);
    slideOutAnimation = new AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )
      ..addListener(() {
        setState(() {
          cardOffset = slideOutTween.evaluate(slideOutAnimation);
        });
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            slideOutTween = null;
            cardOffset = const Offset(0.0, 0.0);
            widget.cardStatus.reset();
          });
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Column(children: [
    //   Transform(
    //     transform: Matrix4.translationValues(cardOffset.dx, cardOffset.dy, 0.0),
    //     child: Container(
    //       color: Colors.pink,
    //       height: 100.0,
    //       width: 100.0,
    //     ),
    //   ),
    //   RaisedButton(
    //     onPressed: () {},
    //     child: Text('up'),
    //   ),
    //   RaisedButton(
    //     onPressed: () {},
    //     child: Text('down'),
    //   )
    // ]);
    return Container(
      padding: EdgeInsets.all(25.0),
      child: Transform(
        transform: Matrix4.translationValues(cardOffset.dx, cardOffset.dy, 0.0),
        child: FlipCard(
            direction: FlipDirection.HORIZONTAL, // default
            front: _buildFrontCard(),
            back: _buildBackCard()),
      ),
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

        case Decision.known:
          _slideRight();
          break;

        case Decision.favourite:
          _slideUp();
          break;
        default:
      }
    }
  }

  void _slideLeft() async {
    final screenWidth = context.size.width;
    slideOutTween = new Tween(
        begin: const Offset(0.0, 0.0), end: new Offset(-2 * screenWidth, 0.0));
    slideOutAnimation.forward(from: 0.0);
  }

  void _slideRight() async {
    final screenWidth = context.size.width;
    slideOutTween = new Tween(
        begin: const Offset(0.0, 0.0), end: new Offset(2 * screenWidth, 0.0));
    slideOutAnimation.forward(from: 0.0);
  }

  void _slideUp() async {
    final screenHeight = context.size.height;
    slideOutTween = new Tween(
        begin: const Offset(0.0, 0.0), end: new Offset(0.0, -2 * screenHeight));
    slideOutAnimation.forward(from: 0.0);
  }
}
