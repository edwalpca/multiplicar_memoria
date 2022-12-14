import 'package:flutter/material.dart';
import 'package:tsw_multiplicacion/pages/menu_page.dart';
import 'package:provider/provider.dart';

//Providers de Mmi aplicacion
import 'package:tsw_multiplicacion/provider/provider_multiiplicar.dart';
import 'package:tsw_multiplicacion/provider/provider_puntos.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers:[
        
        //Proveedores de mi aplicacion para el manejo de estado.
        ChangeNotifierProvider(create: (_) => ValidarProvider()),
        ChangeNotifierProvider(create: (_) => Puntos())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tablas de Multiplicar',
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Tablas de Multiplicar'),
            ),
            body: const MenuPage(),
          ),
        ),
      ),
    );
  }
}