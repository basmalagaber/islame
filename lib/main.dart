import 'package:flutter/material.dart';
import 'package:route_flutter_assignment5/sura_detailes.dart';

import 'cache.dart';
import 'hadith_detailes.dart';
import 'home_page.dart';
import 'onboard_screen.dart';
import 'splash_icon.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cache.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Cache.getEligibility() == true
          ? HomePage.routeName
          : HomePage.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        SplashIcon.routeName: (context) => SplashIcon(),
        OnboardScreen.routeName: (context) => OnboardScreen(),
        HomePage.routeName: (context) => HomePage(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
        SuraDetailes.routeName: (context) => SuraDetailes(),
      },
    );
  }
}
