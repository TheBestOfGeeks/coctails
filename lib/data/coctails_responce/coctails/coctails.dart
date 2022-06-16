import 'package:flutter/foundation.dart';

import 'drink.dart';

@immutable
class Coctails {
  final List<Drink>? drinks;

  const Coctails({this.drinks});

  factory Coctails.fromJson(Map<String, dynamic> json) => Coctails(
        drinks: (json['drinks'] as List<dynamic>?)
            ?.map((e) => Drink.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'drinks': drinks?.map((e) => e.toJson()).toList(),
      };
}
