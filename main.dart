void main() {
  var deck = new Deck();
  //print(deck);
  //print(deck.deal(5));
  print(deck);
  deck.removeCard('Diamonds', '5');
  print(deck);
}

class Deck {
  //constructor
  Deck() {
    var suitList = ['Hearts', 'Diamonds', 'Clubs', 'Spades'];
    var rankList = [
      "Ace",
      "2",
      "3",
      "4",
      "5",
    ];
    for (var mySuit in suitList) {
      for (var myRank in rankList) {
        cards.add(new Card(rank: myRank, suit: mySuit));
      }
    }
  }
  //properties
  List<Card> cards = [];

  //functions
  void printCards() {}
  void shuffle() {
    cards.shuffle();
  }

  dynamic cardsWithSuit(String suit) {
    return cards.where((card) => card.suit == suit);
  }

  dynamic deal(int handSize) {
    var hand = cards.sublist(0, handSize);
    cards = cards.sublist(handSize);
    return hand;
  }

  String toString() {
    return cards.toString();
  }

  void removeCard(String suit, String rank) {
    cards.removeWhere((card) => (card.suit == suit) && (card.rank == rank));
  }
}

class Card {
  //constructor
  Card({this.suit = '', this.rank = ''});

  //properties
  String rank = '';
  String suit = '';

  String toString() {
    return '${this.rank} of ${this.suit}';
  }
}
