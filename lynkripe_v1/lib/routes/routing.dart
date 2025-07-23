// import 'package:go_router/go_router.dart';
// import 'package:lynkripe_v1/models/hub_model.dart';
// import 'package:lynkripe_v1/pages/home.dart';
// import 'package:lynkripe_v1/pages/profile.dart';

// class Routerconfig{
//   static const String home = '/';
//    static const String login = '/login';
//    static const String register = '/register';
//   static const String hubs = '/hubs';
//   static const String profile = '/profile';
//   static const String sharedHub = '/sharedHub';

//   static final GoRouter router = GoRouter(
//     initialLocation: home,
//     routes:[
//       GoRoute(
//         name:home,
//         path: home,
//         builder:(context,state) => const Explore()
//         ),
//          GoRoute(
//         name:sharedHub,
//         path: sharedHub,
//         builder:(context,state){
//           final id =  state.queryParameters['id'];
//           return Hubs()
//         }),
//          GoRoute(
//         name:profile,
//         path: profile,
//         builder:(context,state) => const profile()
//         )
        

//     ]
    
//   );
// }