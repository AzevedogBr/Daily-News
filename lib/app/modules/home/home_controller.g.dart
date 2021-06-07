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

  final _$saveApiFakeAtom = Atom(name: '_HomeControllerBase.saveApiFake');

  @override
  DailyNewsModel get saveApiFake {
    _$saveApiFakeAtom.reportRead();
    return super.saveApiFake;
  }

  @override
  set saveApiFake(DailyNewsModel value) {
    _$saveApiFakeAtom.reportWrite(value, super.saveApiFake, () {
      super.saveApiFake = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

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
saveApiFake: ${saveApiFake}
    ''';
  }
}
