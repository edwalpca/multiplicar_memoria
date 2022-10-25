import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tsw_multiplicacion/pages/menu_page.dart';
import 'package:provider/provider.dart';

import '../provider/provider_multiiplicar.dart';

class BotonNUmero extends StatelessWidget {
  final int numero;

  const BotonNUmero({super.key, required this.numero});

  @override
  Widget build(BuildContext context) {
    final providerOperacion = Provider.of<ValidarProvider>(context);

    return Container(
      padding: const EdgeInsets.all(10),
      width: 75,
      height: 75,
      color: Colors.grey.shade900,
      child: ElevatedButton(
        style: const ButtonStyle(),
        child: Text(
          numero.toString(),
          style: const TextStyle(fontSize: 24),
        ),
        onPressed: () {
          var intValue = Random().nextInt(10);
          //providerOperacion.numero1 = numero;
          //providerOperacion.numero2 = intValue;
     
          providerOperacion.asignarNumeros(numero,intValue);
          print(
              'Operacion: ${providerOperacion.numero_1} x ${providerOperacion.numero_2}');
        },
      ),
    );
  }
}
