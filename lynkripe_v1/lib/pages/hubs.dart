import 'package:flutter/material.dart';
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset('assets/hubs.png', height: 150),
          bottom: const TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.diversity_2)),
              Tab(icon: Icon(Icons.star)),
            ],
          ),
        ),
        body: TabBarView(
          children: const <Widget>[
            Center(child: HubCard()),
            Center(child: Text("It's sunny here")),
          ],
        ),
      ),
    );
  }
}
