
import 'package:flutter/material.dart';
import '/constants.dart';

class Custombutton extends StatelessWidget{

  final String buttonText;
    const Custombutton({
      super.key,
      required this.buttonText
      });

    @override
    Widget build(BuildContext context){
       return SizedBox(
        height:60,
        width: double.infinity,
        child:ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(
                    backgroundColor: primary,   
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), 
              child: Text(buttonText, style: h2.copyWith(color:white, fontSize:20)),
                             ),     
       );

    }
}