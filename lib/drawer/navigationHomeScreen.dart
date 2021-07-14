import 'package:bit_calculator/Screens/Byte.dart';
import 'package:bit_calculator/Screens/home.dart';
import 'package:bit_calculator/Utilities/diolog.dart';
import 'package:bit_calculator/drawer/drawerUserController.dart';
import 'package:bit_calculator/drawer/homeDrawer.dart';
import 'package:flutter/material.dart';
import 'package:open_appstore/open_appstore.dart';
//import 'package:rate_my_app/rate_my_app.dart';
import 'package:share_extend/share_extend.dart';
//import 'package:url_launcher/url_launcher.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex,currentIndex;
  
  AnimationController sliderAnimationController; //line 136 balanna

  

  @override
  void initState() {
    drawerIndex = DrawerIndex.Home;
    screenView = MyHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            animationController: (AnimationController animationController) {
              sliderAnimationController = animationController;
            },
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
            },
            screenView: screenView,
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.Home) {
        setState(() {
          screenView = MyHomePage();
          drawerIndex = DrawerIndex.Home;
        });
      } else if (drawerIndex == DrawerIndex.ShareApp) {
        ShareExtend.share(
                  "Do you want calculate between bits and bytes, \nDownload Bit Calculator \n click here\nhttps://play.google.com/store/apps/details?id=com.bitclpkg.bit_calculator",
                  "text");
        setState(() {
          drawerIndex = currentIndex;
          if (currentIndex == DrawerIndex.Home) {
            screenView = MyHomePage();
          } else {
            screenView = ByteScreen();
          }
        });
      } else if (drawerIndex == DrawerIndex.RateApp) {
        
          OpenAppstore.launch(
              androidAppId: "com.bitclpkg.bit_calculator");

          //Navigator.of(context).pop();
        
        setState(() {
          drawerIndex = currentIndex;
          if (currentIndex == DrawerIndex.Home) {
            screenView = MyHomePage();
          } else {
            screenView = ByteScreen();
          }
        });
      } else if (drawerIndex == DrawerIndex.Byte) {
        setState(() {
          drawerIndex = DrawerIndex.Byte;
          screenView = ByteScreen();
        });
      } 
       else if (drawerIndex == DrawerIndex.About) {
        
        /* showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return policyDiolog(mdFileName: "About.md");
            }); */
            setState(() {
          drawerIndex = currentIndex;
          if (currentIndex == DrawerIndex.Home) {
            screenView = MyHomePage();
          } else {
            screenView = ByteScreen();
          }
        });
      } else if (drawerIndex == DrawerIndex.Privacy) {
         /* showDialog(
                  context: context,
                  builder: (context) {
                    return policyDiolog(mdFileName: "privacy_policy.md");
                  }); */
                  setState(() {
          drawerIndex = currentIndex;
          if (currentIndex == DrawerIndex.Home) {
            screenView = MyHomePage();
          } else {
            screenView = ByteScreen();
          }
        });
      } else if (drawerIndex == DrawerIndex.Terms) {
        
              /* showDialog(
                  context: context,
                  builder: (context) {
                    return policyDiolog(mdFileName: "Terms_and_conditions.md");
                  }); */
                  setState(() {
          drawerIndex = currentIndex;
          if (currentIndex == DrawerIndex.Home) {
            screenView = MyHomePage();
          } else {
            screenView = ByteScreen();
          }
        });
      }
    }
  }
}
