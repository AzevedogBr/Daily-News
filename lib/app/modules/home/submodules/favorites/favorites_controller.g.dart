// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritesController on _FavoritesControllerBase, Store {
  final _$favoriteNewsAtom =
      Atom(name: '_FavoritesControllerBase.favoriteNews');

  @override
  List<News> get favoriteNews {
    _$favoriteNewsAtom.reportRead();
    return super.favoriteNews;
  }

  @override
  set favoriteNews(List<News> value) {
    _$favoriteNewsAtom.reportWrite(value, super.favoriteNews, () {
      super.favoriteNews = value;
    });
  }

  @override
  String toString() {
    return '''
favoriteNews: ${favoriteNews}
    ''';
  }
}
