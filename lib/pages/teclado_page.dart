import 'package:flutter/material.dart';


class TecladoPage extends StatefulWidget {

  const TecladoPage({Key? key}) : super(key: key);

  @override
  State<TecladoPage> createState() => _TecladoPageState();
}

class _TecladoPageState extends State<TecladoPage> {
  
    final FocusNode _focusNode = FocusNode();

    @override
  void initState() {

    super.initState();

      _focusNode.addListener(() {
          if (!_focusNode.hasFocus) {
            FocusScope.of(context).requestFocus(_focusNode);
          }
        }
      );


  }

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          //appBar: AppBar(title: const Text('Focus Example')),
          body: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  focusNode: _focusNode,
                  decoration: const InputDecoration(
                    labelText: 'Focued field'
                  ),
                  autofocus: true,
                ),
              ],
            ),
          ),
        ),
      );
    }
}