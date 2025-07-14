import 'package:flutter/material.dart';
import 'package:lynkripe_v1/constants.dart';

class Tags extends StatelessWidget{

   final String category;

   const Tags({
      super.key,
      required this.category
      });


    @override
    Widget build(BuildContext context){
       return Container(
                  decoration: BoxDecoration(
                    color: lightPrimary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    child: Text(
                     category,
                      style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                );
    }
}