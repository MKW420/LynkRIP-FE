import 'package:flutter/material.dart';

class SharedHub extends StatelessWidget{
  final String? hubId;

  const SharedHub({ super.key, required this.hubId});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(child:Text('Hub ID: $hubId')),
    );
  }
}