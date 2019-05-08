import 'db_create_histori.dart';
import 'Histori.dart';
import 'dart:async';

abstract class HomeContract {
  void screenUpdate();
}

class HomePresenter {
  HomeContract _view;
  var db = new DatabaseHelper();
  HomePresenter(this._view);
  delete(Histori histori) {
    var db = new DatabaseHelper();
    db.deleteHistori(histori);
    updateScreen();
  }

  Future<List<Histori>> getHistori() {
    return db.getHistori();
  }

  updateScreen() {
    _view.screenUpdate();

  }
}