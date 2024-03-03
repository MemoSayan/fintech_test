import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@Singleton()
class FormatHelpers {
String formatAmount(int amount, String currency) {
  if (currency == 'USD') {
    final formatter = NumberFormat.compactCurrency(locale: 'en_US', symbol: '');
    return formatter.format(amount);
  } else {
    final formatter = NumberFormat.currency(locale: 'es_PY', symbol: '', decimalDigits: 0);
    return formatter.format(amount);
  }
}

}
