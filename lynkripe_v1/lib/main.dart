import 'package:flutter/material.dart';
import 'package:lynkripe_v1/firebase_options.dart';
import '/pages/onboarding/onboarding.dart';
import 'pages/auth_signUp.dart';
import '/pages/Home.dart';
import '/pages/hubs.dart';
import '/pages/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: auth());
  }
}

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: <Widget>[
        const Explore(),
        const Hubs(),
        const Profile(),
      ][currentPageIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        backgroundColor: Colors.white70,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.grey[200],
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.hub), label: 'Hubs'),
          NavigationDestination(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
