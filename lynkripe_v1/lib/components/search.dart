
import 'package:flutter/material.dart';

class search extends StatelessWidget{
    const search({super.key});

    @override
    Widget build(BuildContext context){
       return Padding(
              
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Linkrs...',
                prefixIcon: const Icon(Icons.search, size: 20),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
              ),
            ),
      
       );

    }
}