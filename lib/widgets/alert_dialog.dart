import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


//Metodo para Mostrar la Alert de Dialogo en iOS.
void displayDialogIOS(BuildContext context){
   
      //Codigo que se visualiza bien en iOS.
      showCupertinoDialog(
      // Para Bloquear el Modal
      //por defecto viene que si se pueda cerrar
      barrierDismissible: false,
      context: context,
      builder: (context){
        return CupertinoAlertDialog(
          //Redondea el Alert en los borders fr ls ventana emergente.
          title: const Text('Titulo Alert'),
          // ignore: unnecessary_const
          content: Column(
            //Determina el espacio a utilizar de acuerdo al contenido del
            //Widget por defecto esta en MainAxisSize.max ( utiliz todo el espacio posible)
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
                Text('Contenido de la Alerta Emergente'),
                SizedBox(height: 15,),
                FlutterLogo(size: 100)
            ],
          ),
          // acciones sobre mi alerta
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('Cancelar', style: TextStyle(color: Colors.red),)),
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('Ok'))            
          ],


        );

      });



  }





  // Metodo para mostrar la alerta de Dialog en Android
  void displayDialogAndroid(BuildContext context, IconData icon, Color color, [String titulo='Titulo']){

    //Codigo que se visualiza bien en Android.
    showDialog(
      // Para Bloquear el Modal
      //por defecto viene que si se pueda cerrar
      barrierDismissible: false,
      context: context,
      builder: (context){

        return AlertDialog(
          //Redondea el Alert en los borders fr ls ventana emergente.
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(12.0),
          ),
          elevation: 5,
          title: Text(titulo),
          // ignore: unnecessary_const
          content: Column(
            //Determina el espacio a utilizar de acuerdo al contenido del
            //Widget por defecto esta en MainAxisSize.max ( utiliz todo el espacio posible)
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                //Text('Contenido de la Alerta Emergente'),
                const SizedBox(height: 15,),
                //FlutterLogo(size: 100),
                Icon(icon, size: 130, color: color)
            ],
          ),
          // acciones sobre mi alerta
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('Aceptar'))
          ],


        );

      });

  }