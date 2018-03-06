import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './quote_card.dart' show QuoteCard;
import './quote.dart' show Quote;

class QuoteCardBack extends StatelessWidget {
  final Quote quote;
  final Animation<double> anim;
  final VoidCallback flipCallback;

  QuoteCardBack({
    @required this.quote,
    @required this.anim,
    @required this.flipCallback
  }) : assert(quote != null),
       assert(quote.descriptions.length == 2),
       assert(anim != null),
       assert(flipCallback != null);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    var widget = new SafeArea(
      top: false,
      bottom: false,
      child: new Container(
        padding: const EdgeInsets.all(8.0),
        height: QuoteCard.height,
        child: new Card(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: new DefaultTextStyle(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: descriptionStyle,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text('detail 1'),
                        new Text('detail 2'),
                        new Text('detail 3'),
                        new Text('...'),
                        new Text('detail N'),
                      ],
                    ),
                  ),
                ),
              ),
              new Divider(),
              new ButtonTheme.bar(
                child: new ButtonBar(
                  alignment: MainAxisAlignment.end,
                  children: [
                    new FlatButton(
                      child: const Text('FLIP BACK'),
                      textColor: Colors.black54,
                      onPressed: flipCallback,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return new AnimatedBuilder(
      child: widget,
      animation: anim,
      builder: (ctx, child) {
        final t = new Matrix4.identity()
          ..scale(anim.value, 1.0, 1.0);
        
        return new Transform(
          transform: t,
          alignment: FractionalOffset.center,
          child: child,
        );
      },
    );
  }
}
