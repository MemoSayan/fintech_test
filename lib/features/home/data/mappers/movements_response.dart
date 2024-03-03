
class MovementsResponse {

  MovementsResponse({
     this.movements,
  });

  factory MovementsResponse.fromJson(List<Map<String, dynamic>> json) {
    return MovementsResponse(
    movements: json
    .map(MovementResponse.fromJson)
    .toList(),
    );
  }
   List<MovementResponse>? movements;
}
  
class MovementResponse {
  final String id;
  final String category;
  final String description;
  final String createdAt;
  final String beneficiary;
  final int amount;
  final String currencyCode;
  final String currency;

  MovementResponse({
    required this.id,
    required this.category,
    required this.description,
    required this.createdAt,
    required this.beneficiary,
    required this.amount,
    required this.currencyCode,
    required this.currency,
  });

  factory MovementResponse.fromJson(Map<String, dynamic> json) {
    return MovementResponse(
      id: json['id'] == null ? '' : json['id'] as String,
      category: json['category'] == null ? '' : json['category'] as String,
      description: json['description'] == null ? '' : json['description'] as String,
      createdAt: json['createdAt'] == null ? '' : json['createdAt'] as String,
      beneficiary: json['beneficiary'] == null ? '' : json['beneficiary'] as String,
      amount: json['amount'] == null ? 0 : json['amount'] as int,
      currency: json['currency'] == null ? '' : json['currency'] as String,
      currencyCode: json['currencyCode'] == null ? '' : json['currencyCode'] as String,
    );
  }

  factory MovementResponse.fromJsonList(List<Map<String, dynamic>> json) {
    return MovementResponse.fromJson(json.first);
  }
}
