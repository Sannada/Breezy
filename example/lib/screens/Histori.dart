
class Histori {

  int id;
  String _startPoint;
  String _endPoint;
  String _minBudget;
  String _maxBudget;
  String _numberOfGuests;
  String _departureDate;
  String _arriveDate;


  Histori(
      this._startPoint,
      this._endPoint,
      this._minBudget,
      this._maxBudget,
      this._numberOfGuests,
      this._departureDate,
      this._arriveDate,);

  Histori.map(dynamic obj) {
    this._startPoint = obj["startPoint"];
    this._endPoint = obj["endPoint"];
    this._minBudget = obj["minBudget"];
    this._maxBudget = obj["maxBudget"];
    this._numberOfGuests = obj["numberOfGuests"];
    this._departureDate = obj["departureDate"];
    this._arriveDate = obj["arriveDate"];
  }

  String get startPoint => _startPoint;

  String get endPoint => _endPoint;

  String get minBudget => _minBudget;

  String get maxBudget => _maxBudget;

  String get numberOfGuests => _numberOfGuests;

  String get departureDate => _departureDate;

  String get arriveDate => _arriveDate;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["startPoint"] = _startPoint;
    map["endPoint"] = _endPoint;
    map["minBudget"] = _minBudget;
    map["maxBudget"] = _maxBudget;
    map["numberOfGuests"] = _numberOfGuests;
    map["departureDate"] = _departureDate;
    map["arriveDate"] = _arriveDate;
    return map;
  }
  void setHistoriId(int id) {
    this.id = id;
  }
}