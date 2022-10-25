import 'package:flutter/cupertino.dart';

// Clase para almacenar los puntos que va obteniendo el usuario por
// respuestas correctas.
class Puntos extends ChangeNotifier {
  //variable que me indica los puntos que voy obteniendo
  //por las respuestas correctas.
  int _puntos = 0;
  int _incorrectas = 0;

  //Funcion que suma los Puntos de las
  //respuestas correctas.
  void sumaPuntos() {
    
    _puntos++;
    print('Puntos Ganados: ${puntos}');

    notifyListeners();
 
  }

  //Funcion para Sumas las incorrectas
  void sumaIncorrectas() {
    _incorrectas++;
    print('Respuestas Incorrectas: ${_incorrectas}');
    notifyListeners();


  }

  //Getter de incorrectas
  get incorrectas => _incorrectas;

  //Getter de puntos Ganados
  get puntos => _puntos;
}
