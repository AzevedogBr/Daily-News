import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {

  String validatorEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Esse campo não pode ficar vazio';
    }
    if (!isEmail(value)) {
      return 'Digite um e-mail válido';
    }
    return null;
  }

  bool isEmail(value) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
  }

  String validatorPassword(value) {
    if (value == null || value.isEmpty) {
      return 'Esse campo não pode ficar vazio';
    }

    if (value.length < 6) {
      return 'Digite no mínimo 6 caracteres';
    }
    return null;
  }

  String validatorString(value) {
    if (value == null || value.isEmpty) {
      return 'Esse campo não pode ficar vazio';
   }
    if (value.length < 6) {
      return 'Digite no mínimo 6 caracteres';
    }
    return null;
  }

  bool formIsValid(GlobalKey<FormState> key) => key.currentState.validate();
}