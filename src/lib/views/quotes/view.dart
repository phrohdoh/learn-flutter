import 'package:flutter/material.dart';

import './quote.dart' show Quote, QuoteType, Period;
import './quote_card.dart' show QuoteCard;

final quotes = <Quote>[
  const Quote(
    id: 1,
    premium: 609.28,
    name: "InsABC Automobile",
    descriptions: const <String>[
      "Bodily Injury: 15k/30k",
      "Property Damage: 25k",
    ],
    period: Period.SemiAnnual,
    type: QuoteType.Auto,
  ),
  const Quote(
    id: 2,
    premium: 628.14,
    name: "InsXYZ Automobile",
    descriptions: const <String>[
      "Bodily Injury: 50k/100k",
      "Property Damage: 50k",
    ],
    period: Period.SemiAnnual,
    type: QuoteType.Auto,
  ),
  const Quote(
    id: 2,
    premium: 544.67,
    name: "InsXYZ Renters",
    descriptions: const <String>[
      "Personal Property: 2.5k",
      "Liability: 100k",
    ],
    period: Period.Annual,
    type: QuoteType.Rent,
  ),
];

class QuotesListPage extends StatefulWidget {
  @override
  _QuotesListPageState createState() => new _QuotesListPageState();
}

class _QuotesListPageState extends State<QuotesListPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Quotes'),
        actions: [
          new IconButton(
            icon: new Icon(Icons.shopping_cart),
            tooltip: 'Checkout',
            onPressed: () {},
          ),
        ],
      ),
      body: new ListView(
        itemExtent: QuoteCard.height,
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        children: quotes.map((Quote quote) {
          return new Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: new QuoteCard(quote),
          );
        }).toList(),
      ),
    );
  }
}
