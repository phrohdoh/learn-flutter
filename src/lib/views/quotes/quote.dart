import 'package:flutter/foundation.dart';

enum Period {
  SemiAnnual,
  Annual,
}

enum QuoteType {
  Auto,
  Home,
  Rent,
}

class Quote {
  final int id;
  final double premium;
  final String name;
  final List<String> descriptions;

  final Period period;
  final QuoteType type;

  const Quote({
    @required this.id,
    @required this.premium,
    @required this.name,
    @required this.descriptions,
    @required this.period,
    @required this.type,
  })  : assert(id != null)
      , assert(premium != null && premium > -1)
      , assert(name != null && name.length > 0)
      , assert(descriptions != null)
      , assert(period != null)
      , assert(type != null)
      ;

  String get assetName {
    switch (type) {
      case QuoteType.Auto: return "assets/auto.jpg";
      case QuoteType.Rent: return "assets/rent.jpg";
      case QuoteType.Home: return "assets/home.jpg";
      default: return null;
    }
  }

  String get periodDisplay {
    switch (period) {
      case Period.Annual: return "12 months";
      case Period.SemiAnnual: return "6 months";
      default: return null;
    }
  }
}
