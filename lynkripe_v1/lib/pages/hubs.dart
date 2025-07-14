import 'package:flutter/material.dart';
import 'package:lynkripe_v1/constants.dart';
import '/components/HubCard.dart';

class Hubs extends StatelessWidget {
  const Hubs({super.key});

  //catching text values
  //final nameController = TextEditingController();
  //calling to catch whats entered
  //TextFormField(controller:nameController, decoration:const InputDecoration(hintText: 'Name'))
  //button submit
  //onPressed: (){ CollectionReference collRef = FirebaseFirestore.instnace.collection('client');
  //collRef.add({
  //'name': nameController.Text})}
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: background,
          centerTitle: true,
          title: Image.asset('assets/logo.png', height: 150),
          bottom: const TabBar(
            indicatorColor: primary,
            labelColor: primary,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.diversity_2, color: primary,)),
              Tab(icon: Icon(Icons.star)),
            ],
          ),
        ),
        body: TabBarView(
          children: const <Widget>[
            Center(child: HubCard(title:'Enchanted Tales', description: 'Enchanted Tales of the tech world', imgSrc: 'assets/p.jpg',)),
            Center(child: Text("It's sunny here")),
          ],
        ),
      ),
    );
  }
}
