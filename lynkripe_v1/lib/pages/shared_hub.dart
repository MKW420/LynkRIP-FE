import 'package:flutter/material.dart';
import 'package:lynkripe_v1/constants.dart';

class SharedHub extends StatelessWidget{
  final String? hubId;

  const SharedHub({ super.key, required this.hubId});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      //  body: Center(child:Text('Hub ID: $hubId')),
      backgroundColor: background,
      body:Center(
        child:
        Card(
        color: primary,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        ),
        child: SizedBox(
          width:300,
          height:500,
          child:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              CircleAvatar(
                backgroundColor: hubColor,
                radius: 50,
                backgroundImage: AssetImage('assets/hub.jpg'),

              ),
              const SizedBox(
                height: 20,
              ),
              Text('Peaceful Reads',
              style:TextStyle(
                fontSize: 30,
                color: background,
                fontWeight: FontWeight.w500
              )),
              const SizedBox(
                height: 20,
              ),
                Text('No magical thinking required',
              style:TextStyle(
                fontSize: 15,
                color: background,
                fontWeight: FontWeight.w200
              )),
               const SizedBox(
                height: 20,
              ),
                Text('By Jane Doe',
              style:TextStyle(
                fontSize: 10,
                color: background,
                fontWeight: FontWeight.w200
              )),
               const SizedBox(
                height: 150,
              ),
              Center(
              child: Row(
              children: [
                IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(Icons.share, size: 25.0, color: background ,),
                        ),
                IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(Icons.link, size: 25.0, color: background ,),
                        ),
              Text('40 links',
              style:TextStyle(
                fontSize: 15,
                color: background,
                fontWeight: FontWeight.w200
              )),
                   ]
              ) ,
              ),
             
            ],)
            ),
         
      )
        ),

      ),
      
      
      
      
    );
  }
}