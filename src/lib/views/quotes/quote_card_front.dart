import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './quote_card.dart' show QuoteCard;
import './quote.dart' show Quote;

class QuoteCardFront extends StatelessWidget {
  final Quote quote;
  final Animation<double> anim;
  final VoidCallback flipCallback;

  QuoteCardFront({
    @required this.quote,
    @required this.anim,
    @required this.flipCallback
  }) : assert(quote != null)
     , assert(quote.descriptions.length == 2)
     , assert(anim != null)
     , assert(flipCallback != null)
     ;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
        theme.textTheme.headline.copyWith(color: Colors.white);
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
              new SizedBox(
                height: 184.0,
                child: new Stack(
                  children: [
                    new Positioned.fill(
                      child: new Image.asset(
                        quote.assetName,
                        fit: BoxFit.cover,
                      ),
                    ),
                    new Positioned(
                      bottom: 16.0,
                      left: 16.0,
                      right: 16.0,
                      child: new FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: new Text(
                          quote.name,
                          style: titleStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                        new Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: new Row(
                            children: [
                              new Text(
                                "\$${quote.premium}",
                                style: descriptionStyle.copyWith(
                                  color: Colors.green,
                                ),
                              ),
                              new Text(" / ${quote.periodDisplay}"),
                            ],
                          ),
                        ),
                        new Text(quote.descriptions[0]),
                        new Text(quote.descriptions[1]),
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
                      child: const Text('PURCHASE'),
                      textColor: theme.primaryColor,
                      textTheme: ButtonTextTheme.primary,
                      onPressed: () {/* do nothing */},
                    ),
                    new FlatButton(
                      child: const Text('DETAILS'),
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
        final t = new Matrix4.identity()..scale(anim.value, 1.0, 1.0);

        return new Transform(
          transform: t,
          alignment: FractionalOffset.center,
          child: child,
        );
      },
    );
  }
}
