import 'package:bit_calculator/Screens/SplashScreen.dart';
import 'package:bit_calculator/Utilities/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        textTheme: AppTheme.textTheme,
        accentColor: Colors.green,
        textSelectionColor: Colors.green,
        textSelectionHandleColor: Colors.green,
        platform: TargetPlatform.iOS,
      ),
      debugShowCheckedModeBanner: false,
      home: SplachScreen(),
    );
  }
}



