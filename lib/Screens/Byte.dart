import 'package:bit_calculator/Utilities/Byte.dart';
import 'package:bit_calculator/Utilities/appContent.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ByteScreen extends StatefulWidget {
  @override
  _ByteScreenState createState() => _ByteScreenState();
}

class _ByteScreenState extends State<ByteScreen> {
  DateTime currentBackPressTime;
  List<Information> information = Information.information;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "click 'back' again to exit");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: screenAppBar("Byte and Bits"),
          body: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: GridView(
                      children: List.generate(information.length, (index) {
                        return InformationListView(
                          listData: information[index],
                        );
                      }),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: 5.0,
                        childAspectRatio: 3.0,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InformationListView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final Information listData;

  const InformationListView({Key key, this.animationController, this.animation, this.listData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Column(
     mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
                shape: BoxShape.rectangle,
                border:
                    Border.all(width: 5.0, color: Colors.red.withOpacity(0.5))),
            width: MediaQuery.of(context).size.width,
            height:screenHeightSize(100, context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(listData.title, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25.0*MediaQuery.of(context).size.aspectRatio),),
                SizedBox(
                  height: 20.0,
                ),
                Text(listData.discription,style: TextStyle(color: Colors.white, fontSize: 20.0*MediaQuery.of(context).size.aspectRatio, fontWeight: FontWeight.w500 ))
              ],
            ),
          ),
      ]
   );
  }
}
