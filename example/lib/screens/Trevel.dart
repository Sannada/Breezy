/*
import 'dart:convert';

Trevel trevelFromJson(String str) {
  final jsonData = json.decode(str);
  return Trevel.fromMap(jsonData);
}

String  trevelToJson(Trevel data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Trevel {
  int id;
  String startPoint;
  String endPoint;
  int minBudget;
  int maxBudget;
  String numberOfGuests;
  String departureDate;
  String arriveDate;

  Trevel({
    this.id,
    this.startPoint,
    this.endPoint,
    this.minBudget,
    this.maxBudget,
    this.numberOfGuests,
    this.departureDate,
    this.arriveDate,
  });

  factory Trevel.fromMap(Map<String, dynamic> json) => new Trevel(
    id: json["id"],
    startPoint: json["startPoint"],
    endPoint: json["endPoint"],
    minBudget: json["minBudget"],
    maxBudget: json["minBudget"],
    numberOfGuests: json["numberOfGuests"],
    departureDate: json["departureDate"],
    arriveDate: json["arriveDate"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    " startPoint":  startPoint,
    "endPoint": endPoint,
    "minBudget": minBudget,
    "maxBudget": maxBudget,
    "numberOfGuests": numberOfGuests,
    "departureDate": departureDate,
    "arriveDate": arriveDate,
  };
}
*/