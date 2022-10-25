import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:tsw_multiplicacion/provider/provider_multiiplicar.dart';
import 'package:tsw_multiplicacion/provider/provider_puntos.dart';
import 'package:tsw_multiplicacion/widgets/alert_dialog.dart';
import 'package:tsw_multiplicacion/widgets/custom_botones.dart';
import 'package:tsw_multiplicacion/widgets/custom_text_field.dart';
import 'package:tsw_multiplicacion/widgets/tablero_teclado.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
              color: Colors.white,
              child: const Center(
                  child: Text(
                'Acierta con las Tablas de Multiplicar',
                style: TextStyle(fontSize: 22),
              )),
            ),
            const TableroMenu(),
            const SizedBox(
              height: 8,
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
                    // TextFieldPersonalizado para que el usuario
                    // Escriba el valor de la Multiplicacion.
                    child: CustomTextField(
                        valueText: valueText,
                        providerOperacion: providerOperacion,
                        providerPuntos: providerPuntos),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  //color: const Color.fromARGB(255, 11, 119, 173),
                  width: double.infinity,
                  height: 55,
                  child: (providerPuntos.puntos > 0)
                      ? ListView.builder(
                          itemCount: providerPuntos.puntos,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return const Icon(
                              Icons.check_circle,
                              size: 35,
                              color: Colors.green,
                            );
                          },
                        )
                      : const Text('Selecciona una tabla de Multiplicacion para iniciar'),
                ),
                //Bloque de Incorrectas.
                //
                Container(
                  padding: const EdgeInsets.all(8.0),
                  //color: const Color.fromARGB(255, 11, 119, 173),
                  width: double.infinity,
                  height: 55,
                  child: (providerPuntos.incorrectas > 0 )?
                  ListView.builder(
                    itemCount: providerPuntos.incorrectas,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                        return const Icon(
                          Icons.dangerous_rounded,
                          size: 35,
                          color: Colors.red,
                        );
                    },
                  )
                  :const Text('Bien Hecho no tienes respuestas incorrectas.'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
