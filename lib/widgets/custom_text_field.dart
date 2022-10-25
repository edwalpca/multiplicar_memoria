import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tsw_multiplicacion/provider/provider_multiiplicar.dart';
import 'package:tsw_multiplicacion/provider/provider_puntos.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.valueText,
    required this.providerOperacion,
    required this.providerPuntos,
  }) : super(key: key);

  final String valueText;
  final ValidarProvider providerOperacion;
  final Puntos providerPuntos;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: TextEditingController(text: valueText),
        decoration: const InputDecoration(
            hintText: '',
            fillColor: Colors.blueGrey,
            filled: true,
            border: OutlineInputBorder()),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style:
            const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        onSubmitted: (value) {
          if (value != '') {
            providerOperacion.respuestaUsuario = int.parse(value);
            int resultado = providerOperacion.validarMultiplicacion();
            if (resultado == 1) {
              // displayDialogAndroid(
              //   context,
              //   Icons.check,
              //   Colors.green,
              //   'Super Bien',
              // );

              providerPuntos.sumaPuntos();
            } else {
              // displayDialogAndroid(
              //   context,
              //   Icons.close,
              //   Colors.redAccent,
              //   'Upss Intentalo de Nuevo',
              // );
              providerPuntos.sumaIncorrectas();
            }
            //print(providerOperacion.resOperacion);
            providerOperacion.respuestaUsuario = 0;

            //
            
          var numero   = Random().nextInt(10);
          var intValue = Random().nextInt(10);
          //providerOperacion.numero1 = numero;
          //providerOperacion.numero2 = intValue;
          providerOperacion.asignarNumeros(numero,intValue);            


          }
        },
      ),
    );
  }
}