
import 'package:flutter/material.dart';
import 'package:lynkripe_v1/constants.dart';

class search extends StatelessWidget{

  final String searchText;
    const search({
      super.key,
      required this.searchText
      });

    @override
    Widget build(BuildContext context){
       return Padding(
              
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: searchText,
                prefixIcon: const Icon(Icons.search, size: 20),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: lightPrimary,
              ),
            ),
      
       );

    }
}