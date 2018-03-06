import 'package:flutter/material.dart';

import './quote.dart' show Quote;
import './quote_card_front.dart' show QuoteCardFront;
import './quote_card_back.dart' show QuoteCardBack;

class QuoteCard extends StatefulWidget {
  final Quote quote;
  static const double height = 366.0;

  QuoteCard(this.quote) : assert(quote != null);

  @override
  _QuoteCardState createState() => new _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> with TickerProviderStateMixin {
  AnimationController _ctrl;
  Animation<double> _frontScale;
  Animation<double> _backScale;

  @override
  void initState() {
    super.initState();
    _ctrl = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _ctrl.addListener(() => this.setState(() {}));

    _frontScale = new Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(new CurvedAnimation(
      parent: _ctrl,
      curve: new Interval(0.0, 0.5, curve: Curves.easeIn),
    ));

    _backScale = new CurvedAnimation(
      parent: _ctrl,
      curve: new Interval(0.5, 1.0, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Stack(
        children: [
          new QuoteCardFront(
            quote: widget.quote,
            anim: _frontScale,
            flipCallback: _flipCallback,
          ),
          new QuoteCardBack(
            quote: widget.quote,
            anim: _backScale,
            flipCallback: _flipCallback,
          ),
        ],
      ),
    );
  }

  void _flipCallback() {
    if (_ctrl.isCompleted || _ctrl.velocity > 0) {
      _ctrl.reverse();
    } else {
      _ctrl.forward();
    }
  }
}
