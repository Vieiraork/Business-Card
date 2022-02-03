import 'package:busnesscard/control/card_data.dart';

class CardList {
  List _cardsListData = [];

  int getIndex() => _cardsListData.length;

  List insertCard(CardData data) {
    _cardsListData.add(data);
    return _cardsListData;
  }
}
