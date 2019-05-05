import 'db_craete_histori_trevels.dart';
import 'Histori.dart';
import 'dart:async';

abstract class HomeContract {
  void screenUpdate();
}

class HomePresenter {
  HomeContract _view;
  var db = new DatabaseHelper();
  HomePresenter(this._view);
  delete(Histori user) {
    var db = new DatabaseHelper();
    db.deleteUsers(user);
    updateScreen();
  }

  Future<List<Histori>> getUser() {
    return db.getUser();
  }

  updateScreen() {
    _view.screenUpdate();

  }
}