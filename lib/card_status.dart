import 'package:flutter/widgets.dart';

enum Decision {
  undecided,
  known,
  unknown,
  favourite,
}

class CardStatus extends ChangeNotifier {
  Decision decision = Decision.undecided;

  void setKnown() {
    if (decision == Decision.undecided) {
      decision = Decision.known;
      notifyListeners();
    }
  }

  void setUnknown() {
    if (decision == Decision.undecided) {
      decision = Decision.unknown;
      notifyListeners();
    }
  }

  void setFavourite() {
    if (decision == Decision.undecided) {
      decision = Decision.favourite;
      notifyListeners();
    }
  }

  void reset() {
    if (decision != Decision.undecided) {
      decision = Decision.undecided;
      notifyListeners();
    }
  }
}
