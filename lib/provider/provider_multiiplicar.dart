import 'package:flutter/material.dart';

class ValidarProvider extends ChangeNotifier {
  //Propiedades de la clase
  int _respuestaUsuario = 0;
  int _numero1 = 0;
  int _numero2 = 0;

  bool _resOperacion = false;

  //setters
  set numero1(int n) {
    _numero1 = n;
  }

  set numero2(int n) {
    _numero2 = n;
  }

  set respuestaUsuario(int n) {
    _respuestaUsuario = n;
  }

  void asignarNumeros(int n1, int n2) {
    _numero1 = n1;
    _numero2 = n2;
    notifyListeners();
  }

  //Getter
  int get numero_1 => _numero1;
  int get numero_2 => _numero2;
  int get respuestausuario => _respuestaUsuario;
  bool get resOperacion => _resOperacion;

  //Funcion de validar la respuesta dada pr el usuario
  // vrs la respuesta del sistema.
  int validarMultiplicacion() {
    //
    final int resultado = _numero1 * _numero2;
    _resOperacion = (resultado == _respuestaUsuario) ? true : false;
    notifyListeners();
    return (resultado == _respuestaUsuario) ? 1 : 0;
  }
}