
import 'package:flashcard/viewmodel/extensions/string_ext.dart';

extension Price on double {
  String convertPrice(int sale) {
    final price = sale >= 100 ? 0 : (this * 100 / (100 - sale));

    if (price > 99999) {
      return (price.round() ~/ 1000 * 1000)
          .toString()
          .insertDotPrice
          .addCurrency;
    }
    if (price > 9999) {
      return (price ~/ 100 * 100).toString().insertDotPrice.addCurrency;
    }
    if (price > 999) {
      return (price ~/ 10 * 10).toString().insertDotPrice.addCurrency;
    }
    return ((price * 100).round() / 100).toString().addCurrency;
  }
}
