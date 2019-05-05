class Histori {

  int id;
  String _nameSity;
  String _firstX;


  Histori(this._nameSity, this._firstX, );

  Histori.map(dynamic obj) {
    this._nameSity = obj["firstname"];
    this._firstX = obj["lastname"];

  }

  String get nameSity => _nameSity;

  String get firstX => _firstX;



  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["firstname"] = _nameSity;
    map["lastname"] = _firstX;
    return map;
  }
  void setHistoriId(int id) {
    this.id = id;
  }
}