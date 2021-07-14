import 'package:bit_calculator/Utilities/ByteList.dart';
import 'package:bit_calculator/Utilities/appContent.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Byte> byteList = Byte.byteList;
  DateTime currentBackPressTime;

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
  void initState() {
    super.initState();
    
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
          appBar: screenAppBar("Bit Calculator"),
          body: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: GridView(
                  padding: EdgeInsets.only(top: 0, left: 12, right: 12),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: List.generate(byteList.length, (index) {
                    return ByteListView(
                      listData: byteList[index],
                      callBack: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    byteList[index].navigationScreen));
                      },
                    );
                  }),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    childAspectRatio: 3.0,
                  ),
                )),
              ],
            ),
          ),
          //drawer: Drawer(),
        ),
      ),
    );
  }
}

class ByteListView extends StatelessWidget {
  final VoidCallback callBack;
  final AnimationController animationController;
  final Animation animation;
  final Byte listData;

  const ByteListView(
      {Key key,
      this.callBack,
      this.animationController,
      this.animation,
      this.listData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            callBack();
          },
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.black.withOpacity(0.05),
                border:
                    Border.all(width: 5.0, color: Colors.red.withOpacity(0.4))),
            width: screenWidthSize(200, context),
            height: screenWidthSize(100, context),
            child: Center(
                child: Text(
              listData.title,
              style: TextStyle(fontSize: fontSize(400, context)),
            )),
          ),
        ),
      ],
    );
  }
}
