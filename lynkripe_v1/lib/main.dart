import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lynkripe_v1/constants.dart';
import 'package:lynkripe_v1/firebase_options.dart';
import 'package:lynkripe_v1/pages/auth_register.dart';
import '/pages/onboarding/onboarding.dart';
import '/pages/Home.dart';
import '/pages/hubs.dart';
import '/pages/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NavigationBarPage());
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
        const profile(),
      ][currentPageIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        backgroundColor: Colors.white70,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: lightPrimary,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home, color: primary,), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.hub, color: primary,), label: 'Hubs'),
          NavigationDestination(
            icon: Icon(Icons.account_circle, color: primary,),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
