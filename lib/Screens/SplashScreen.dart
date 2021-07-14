import 'package:bit_calculator/Utilities/appContent.dart';
import 'package:bit_calculator/drawer/navigationHomeScreen.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  navigtion() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => NavigationHomeScreen()));
          
    });
  }

  @override
  void initState() {
    super.initState();
    navigtion();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor:
            Colors.red[300].withOpacity(0.1), //ThemeData.dark().primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: screenHeightSize(650, context),
            ),
            Image.asset(
              'assets/images/appLogo.png',
              height: screenWidthSize(200, context),
              width: screenWidthSize(200, context),
            ),
            Text(
              'Bit Calculator',
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 34,
              ),
            ),
            Text(
              'Calculate between Bit and Bytes',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
