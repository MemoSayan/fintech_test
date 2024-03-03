import 'package:equatable/equatable.dart';

class Movement extends Equatable {
  const Movement({
    required this.id,
    required this.amount,
    required this.concept,
    required this.date,
    required this.description,
    required this.type,
    required this.currency,
    required this.currencyCode,
  });

  final String id;
  final String amount;
  final String concept;
  final String date;
  final String description;
  final String type;
  final String currency;
  final String currencyCode;

  @override
  List<Object> get props =>
      [id, amount, concept, date, description, type, currency, currencyCode];
}
