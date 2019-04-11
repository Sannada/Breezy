class HistoriTravels {
  int id;
  String name;

  HistoriTravels(this.id, this.name);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
    };
    return map;
  }

  HistoriTravels.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}