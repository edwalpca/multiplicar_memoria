import 'package:flutter/material.dart';
import 'package:tsw_multiplicacion/widgets/custom_botones.dart';

class TableroMenu extends StatelessWidget {
  const TableroMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const <TableRow>[
        TableRow(children: <Widget>[
          BotonNUmero(numero: 1),
          BotonNUmero(numero: 2),
          BotonNUmero(numero: 3),
        ]),
        TableRow(children: <Widget>[
          BotonNUmero(numero: 4),
          BotonNUmero(numero: 5),
          BotonNUmero(numero: 6),
        ]),
        TableRow(children: <Widget>[
          BotonNUmero(numero: 7),
          BotonNUmero(numero: 8),
          BotonNUmero(numero: 9),
        ])
      ],
    );
  }
}
