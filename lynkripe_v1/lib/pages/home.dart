import 'package:flutter/material.dart';
import 'package:lynkripe_v1/components/header.dart';
import 'package:lynkripe_v1/components/lynkCard.dart';
import 'package:lynkripe_v1/constants.dart';
import 'package:lynkripe_v1/socials.dart';
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
      drawer: NavigationDrawer(
        backgroundColor: background,
          
        children: [
          DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 5,
              children: [
                 Icon(Icons.supervised_user_circle_rounded, size: 40, color: primary,),
                 Text("4cynart@gmail.com")

              ],
            )
          ),
          NavigationDrawerDestination(
            backgroundColor: background,
            icon: Icon(Icons.book_rounded, color: primary), 
            label: Text('lynks')),
           
          NavigationDrawerDestination(
            icon: Icon(Icons.hub_rounded,color: primary), 
            label: Text('Hubs')),
          NavigationDrawerDestination(
            icon: Icon(Icons.star,color: primary), 
            label: Text('Starred Hubs')),
          NavigationDrawerDestination(
            icon: Icon(Icons.newspaper_rounded,color: primary), 
            label: Text('Weekly Digest lynks')),
            SizedBox(height: 50,),
            TextButton(onPressed: (){}, 
           
           child: Text('Sign out'),),
           ]),
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
            thumbnail: Container(decoration: const BoxDecoration(color: lightPrimary,)),
            title: 'Flutter 1.0 Launch',
            subtitle: 'Flutter continues to improve and expand its horizons. '
                'This text should max out at two lines and clip',
            source: 'Medium',
            icon: medium, 
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