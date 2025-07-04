
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget{
    const Onboarding({super.key});

    @override
    Widget build(BuildContext context){
      return  Scaffold(
         appBar: AppBar(
            backgroundColor:  Colors.white,
            title: Align(alignment: Alignment.center,child:Text('Lynk', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))),
           
          ),
        
        body:Column(
          children: [
            Container(
              width:MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color:Colors.white,
                 image:DecorationImage(image: AssetImage('assets/linkshare.png'))

              ),
               
             
            ),
            Container(
               width:MediaQuery.of(context).size.width,
              height:290,
              decoration: BoxDecoration(
                color:Colors.white,
              ),
              child:Column(
                children:[
                  Text('Share your Lynk Hubs',
                  style: TextStyle(fontSize:30, fontWeight: FontWeight.bold)),
                  Text('Turn your hubs into public knowledge hubs',
                  style: TextStyle(fontSize:15,))
                ]
              )
             
            ),  
          
          ],
        
      )
      );
    }
    


}
