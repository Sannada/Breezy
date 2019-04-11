class HistoriTravels {
  int id;
  String xStart;
  String yStart;
  String xFinish;
  String yFinish;

  HistoriTravels(this.id, this.xStart);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'xStart': xStart,
      /*
      'yStart': yStart,
      'xFinish': xFinish,
      'yFinish': yFinish,
      */
    };
    return map;
  }

  HistoriTravels.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    xStart = map['xStart'];
    /*
    yStart = map['yStart'];
    xFinish = map['xFinish'];
    yFinish = map['yFinish'];
     */
  }
}