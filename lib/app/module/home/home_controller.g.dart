// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$pageAtom = Atom(name: '_HomeControllerBase.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$indexBarAtom = Atom(name: '_HomeControllerBase.indexBar');

  @override
  int get indexBar {
    _$indexBarAtom.reportRead();
    return super.indexBar;
  }

  @override
  set indexBar(int value) {
    _$indexBarAtom.reportWrite(value, super.indexBar, () {
      super.indexBar = value;
    });
  }

  final _$favoritesPathAtom = Atom(name: '_HomeControllerBase.favoritesPath');

  @override
  List<ItemModel> get favoritesPath {
    _$favoritesPathAtom.reportRead();
    return super.favoritesPath;
  }

  @override
  set favoritesPath(List<ItemModel> value) {
    _$favoritesPathAtom.reportWrite(value, super.favoritesPath, () {
      super.favoritesPath = value;
    });
  }

  final _$savePathAtom = Atom(name: '_HomeControllerBase.savePath');

  @override
  bool get savePath {
    _$savePathAtom.reportRead();
    return super.savePath;
  }

  @override
  set savePath(bool value) {
    _$savePathAtom.reportWrite(value, super.savePath, () {
      super.savePath = value;
    });
  }

  final _$newsAtom = Atom(name: '_HomeControllerBase.news');

  @override
  List<ItemModel> get news {
    _$newsAtom.reportRead();
    return super.news;
  }

  @override
  set news(List<ItemModel> value) {
    _$newsAtom.reportWrite(value, super.news, () {
      super.news = value;
    });
  }

  final _$saveFavoritesAsyncAction =
      AsyncAction('_HomeControllerBase.saveFavorites');

  @override
  Future saveFavorites(ItemModel item) {
    return _$saveFavoritesAsyncAction.run(() => super.saveFavorites(item));
  }

  final _$removeFavoritesPathAsyncAction =
      AsyncAction('_HomeControllerBase.removeFavoritesPath');

  @override
  Future removeFavoritesPath(int index) {
    return _$removeFavoritesPathAsyncAction
        .run(() => super.removeFavoritesPath(index));
  }

  final _$saveFavoritesPathAsyncAction =
      AsyncAction('_HomeControllerBase.saveFavoritesPath');

  @override
  Future saveFavoritesPath() {
    return _$saveFavoritesPathAsyncAction.run(() => super.saveFavoritesPath());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic changeIndexBar(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeIndexBar');
    try {
      return super.changeIndexBar(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFavorites(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setFavorites');
    try {
      return super.setFavorites(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeFavorites(int id, int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.removeFavorites');
    try {
      return super.removeFavorites(id, index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToPage(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.goToPage');
    try {
      return super.goToPage(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
indexBar: ${indexBar},
favoritesPath: ${favoritesPath},
savePath: ${savePath},
news: ${news}
    ''';
  }
}
