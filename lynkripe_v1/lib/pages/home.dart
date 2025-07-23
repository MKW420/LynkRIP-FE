import 'package:flutter/material.dart';
import 'package:lynkripe_v1/components/header.dart';
import 'package:lynkripe_v1/components/lynkCard.dart';
import 'package:lynkripe_v1/constants.dart';
import '/components/Tags.dart';
import '/components/search.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});
  static String id = 'main screen';


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CustomListItemExample());
  }
}
class CustomListItemExample extends StatelessWidget {
  const CustomListItemExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar:  const Header(),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 5.0, top: 20.0, bottom: 10.0),
            child: Text(
              'Your Weekly Digest',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          search(searchText: 'search lynks',),
        Column(
          children:[
            ListView.builder(
            itemCount: 7,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
               return  LynkItem(
            thumbnail: Container(decoration: const BoxDecoration(color: lightPrimary)),
            title: 'Flutter 1.0 Launch',
            subtitle: 'Flutter continues to improve and expand its horizons. '
                'This text should max out at two lines and clip',
            source: 'Medium',
            tags: Row(
              children: [
               Tags(category: 'technology',)
              ],
            ),
               );
          
                
              

            })
          ]
        ),
        
        ],
      ),
    );
  }
}