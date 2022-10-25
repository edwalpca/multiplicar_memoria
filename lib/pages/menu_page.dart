import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:tsw_multiplicacion/provider/provider_multiiplicar.dart';
import 'package:tsw_multiplicacion/provider/provider_puntos.dart';
import 'package:tsw_multiplicacion/widgets/alert_dialog.dart';
import 'package:tsw_multiplicacion/widgets/custom_botones.dart';
import 'package:tsw_multiplicacion/widgets/tablero_teclado.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('====================> Build');
    final providerOperacion =
        Provider.of<ValidarProvider>(context, listen: true);

    //Provider de puntos ganados, respuestas incorrectas.
    final providerPuntos = Provider.of<Puntos>(context);

    String valueText = providerOperacion.respuestausuario.toString();
    valueText = (valueText == '0') ? '' : valueText;

    return Scaffold(
      //appBar: AppBar(title: const Text('Tablas de Multiplicar')),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 55,
              color: Colors.amberAccent,
              child: const Center(child: Text('Instrucciones')),
            ),
            const TableroMenu(),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                               Text(
                '${providerOperacion.numero_1} x ${providerOperacion.numero_2} = ',
                style: const TextStyle(fontSize: 50),
              ), 

               Expanded(
                 child: _CustomTextField(
                  valueText: valueText, 
                  providerOperacion: providerOperacion, 
                  providerPuntos: providerPuntos),
               ),

                ],
              ),
            ),   
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  //color: const Color.fromARGB(255, 11, 119, 173),
                  width: double.infinity,
                  height: 45,
                  child: ListView.builder(
                    itemCount: providerPuntos.puntos,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      if (providerPuntos.puntos > 0) {
                        return const Icon(
                          Icons.check_circle,
                          size: 35,
                          color: Colors.green,
                        );
                      }else{
                        return  const Text('Inicia');
                      }
                    },
                  ),
                ),
                //Bloque de Incorrectas.
                //
                Container(
                  padding: const EdgeInsets.all(8.0),
                  //color: const Color.fromARGB(255, 11, 119, 173),
                  width: double.infinity,
                  height: 45,
                  child: ListView.builder(
                    itemCount: providerPuntos.incorrectas,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      if (providerPuntos.puntos > 0) {
                        return const Icon(
                          Icons.dangerous_rounded,
                          size: 35,
                          color: Colors.red,
                        );
                      }else{
                        return  const Text('Inicia');
                      }
                    },
                  ),
                )                
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  const _CustomTextField({
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
