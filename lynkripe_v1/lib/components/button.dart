
import 'package:flutter/material.dart';
import '/constants.dart';

class Custombutton extends StatelessWidget{
    const Custombutton({super.key});

    @override
    Widget build(BuildContext context){
       return SizedBox(
        height:60,
        width: double.infinity,
        child:ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(
                    backgroundColor: black,   
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), 
              child: Text("Sign in", style: h2.copyWith(color:white, fontSize:20)),
                             ),     
       );

    }
}