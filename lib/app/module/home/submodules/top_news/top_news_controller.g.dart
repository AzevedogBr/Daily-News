// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_news_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TopNewsController on _TopNewsControllerBase, Store {
  final _$newsListIdsAtom = Atom(name: '_TopNewsControllerBase.newsListIds');

  @override
  List<int> get newsListIds {
    _$newsListIdsAtom.reportRead();
    return super.newsListIds;
  }

  @override
  set newsListIds(List<int> value) {
    _$newsListIdsAtom.reportWrite(value, super.newsListIds, () {
      super.newsListIds = value;
    });
  }

  final _$loadMoreAtom = Atom(name: '_TopNewsControllerBase.loadMore');

  @override
  bool get loadMore {
    _$loadMoreAtom.reportRead();
    return super.loadMore;
  }

  @override
  set loadMore(bool value) {
    _$loadMoreAtom.reportWrite(value, super.loadMore, () {
      super.loadMore = value;
    });
  }

  final _$newsLimitAtom = Atom(name: '_TopNewsControllerBase.newsLimit');

  @override
  int get newsLimit {
    _$newsLimitAtom.reportRead();
    return super.newsLimit;
  }

  @override
  set newsLimit(int value) {
    _$newsLimitAtom.reportWrite(value, super.newsLimit, () {
      super.newsLimit = value;
    });
  }

  final _$getListItemAsyncAction =
      AsyncAction('_TopNewsControllerBase.getListItem');

  @override
  Future getListItem() {
    return _$getListItemAsyncAction.run(() => super.getListItem());
  }

  final _$_TopNewsControllerBaseActionController =
      ActionController(name: '_TopNewsControllerBase');

  @override
  dynamic addMoreItem() {
    final _$actionInfo = _$_TopNewsControllerBaseActionController.startAction(
        name: '_TopNewsControllerBase.addMoreItem');
    try {
      return super.addMoreItem();
    } finally {
      _$_TopNewsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newsListIds: ${newsListIds},
loadMore: ${loadMore},
newsLimit: ${newsLimit}
    ''';
  }
}
