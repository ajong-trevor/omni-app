import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

import './providers/tours_provider.dart';
import './screens/buttom_navigation_bar_screen.dart';
import './screens/tour_details_screen.dart';
import './screens/tour_screen.dart';
import './screens/user_profile_screen.dart';
import './screens/user_transaction_screen.dart';
import './helpers/custom_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ToursProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Omni',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          accentColor: const Color.fromARGB(255, 0, 255, 234),
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CustomPageTransitionBuilder(),
            TargetPlatform.iOS: CustomPageTransitionBuilder(),
          }),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Quicksand',
        ),
        // home: ButtomNavigationBarScreen(),
        routes: {
          '/': (ctx) => ButtomNavigationBarScreen(),
          TourDetailsScreen.routeName: (ctx) => TourDetailsScreen(),
          TourScreen.routeName: (ctx) => const TourScreen(),
          UserProfileScreen.routeName: (ctx) => const UserProfileScreen(),
          UserTransactionScreen.routName: (ctx) => UserTransactionScreen(),
        },
      ),
    );
  }
}
