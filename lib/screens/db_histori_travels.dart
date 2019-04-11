class HistoriTravels {
  int id;
  String xStart;
  /*
  String yStart;
  String xFinish;
  String yFinish;
*/

  HistoriTravels(this.id, this.xStart);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': xStart,
    };
    return map;
  }

  HistoriTravels.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    xStart = map['name'];
    /*
    yStart = map['yStart'];
    xFinish = map['xFinish'];
    yFinish = map['yFinish'];
     */
  }
}