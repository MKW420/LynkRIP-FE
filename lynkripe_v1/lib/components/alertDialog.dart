import 'package:flutter/material.dart';

class Alertdialog extends StatelessWidget{
    const Alertdialog({super.key});

    @override
    Widget build(BuildContext context){
       return TextButton(
        onPressed: ()=> showDialog<String>(
          context: context, 
          builder: (BuildContext context) =>
          AlertDialog(
            title:const Text(''),
            content: const Text(''),
            actions: <Widget>[
              TextButton(onPressed: ()=>Navigator.pop(context, 'Cancel'),child: const Text('Cancel'),),
              TextButton(onPressed: () => Navigator.pop(context, 'OK'), child: const Text('OK')),
             
            ]
          ),
          ),
          child:const Text('Show dialog'),
       );

    }
}