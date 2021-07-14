import 'dart:math';
import 'package:bit_calculator/Utilities/ByteList.dart';
import 'package:bit_calculator/Utilities/appContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BitBitScreen extends StatefulWidget {
  @override
  _BitBitScreenState createState() => _BitBitScreenState();
}

class _BitBitScreenState extends State<BitBitScreen> {
  TextEditingController _bitController = TextEditingController();
  List<ByteList> bytelist = ByteList.bitList;
  double inputid = 2;
  double outputid = 2;
  int inputId = 2;
  int outputId = 2;
  String result = "";
  ScrollController controller = ScrollController();
  bool onchange = false;
  double inputOpacity = 0.0;
  double outputOpacity = 0.0;
  _toastInfo(String info) {
    Fluttertoast.showToast(msg: info, toastLength: Toast.LENGTH_LONG);
  }

  generate() {
    if (_bitController.text != "") {
      int value = int.parse(_bitController.text);
      int input = pow(1024, inputId);
      int output = pow(1024, outputId);
      double res = value * input / output;
      print(inputId);
      int roundId = 3;
      int sub = inputId - outputId;
      if (sub < 0) {
        sub = 0 - sub;
      }
      if (sub == 4) {
        roundId = 13;
      }
      if (sub == 3) {
        roundId = 9;
      }
      if (sub == 2) {
        roundId = 6;
      }
      if (sub == 1) {
        roundId = 3;
      }
      if (res > 1) {
        roundId = 2;
      }
      setState(() {
        result = "${res.toStringAsFixed(roundId)}";
        print(
            "roundId: $roundId \n inputId: $inputId  \n outputId: $outputId \n sub: $sub");
      });
    } else {}
  }

  opacity(int op) {
    double opacity = 0.0;
    opacity = op * 0.2;
    if (op == 0) {
      opacity = 0.2;
    }
    return opacity;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        colorFilter:
            ColorFilter.mode(Colors.green.withOpacity(0.5), BlendMode.dstATop),
        image: AssetImage("assets/images/background.png"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: screenAppBar("bit - bit"),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Center(
                  child: Container(
                    width: screenWidthSize(300, context),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextField(
                        controller: _bitController,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          hintText: "10100101",
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                    width: screenWidthSize(65, context),
                    height: screenWidthSize(65, context),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green.withOpacity(opacity(inputId)),
                    ),
                    child: Center(
                        child: Text(
                      bytelist[inputId].title,
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ))),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Slider(
                value: inputid,
                min: 0,
                max: bytelist.length.toDouble() - 1,
                divisions: 4,
                activeColor: Colors.green,
                inactiveColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    inputid = value;
                    if (value >= 0.0 && value < 0.9) {
                      inputId = 0;
                    } else if (value >= 1.0 && value < 1.9) {
                      inputId = 1;
                    } else if (value >= 2.0 && value < 2.9) {
                      inputId = 2;
                    } else if (value >= 3.0 && value < 3.9) {
                      inputId = 3;
                    } else if (value >= 4.0 && value < 4.9) {
                      inputId = 4;
                    }
                    generate();
                  });
                }),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                Center(
                  child: Container(
                    width: screenWidthSize(300, context),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                          // width: screenWidthSize(200, context),
                          height: screenHeightSize(45, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              // shape: BoxShape.circle,
                              //color: Colors.green,
                              border:
                                  Border.all(color: Colors.green, width: 2)),
                          child: Center(
                              child: Text(
                            result,
                            maxLines: 1,
                            style: TextStyle(),
                          ))),

                      /* TextField(
                        controller: _bitController,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          hintText: "10100101",
                        ),
                      ), */
                    ),
                  ),
                ),
                Container(
                    width: screenWidthSize(65, context),
                    height: screenWidthSize(65, context),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green.withOpacity(opacity(outputId)),
                    ),
                    child: Center(
                        child: Text(
                      bytelist[outputId].title,
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ))),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Slider(
                value: outputid,
                min: 0,
                max: bytelist.length.toDouble() - 1,
                divisions: 4,
                activeColor: Colors.green,
                inactiveColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    outputid = value;
                    if (value >= 0.0 && value < 0.9) {
                      outputId = 0;
                    } else if (value >= 1.0 && value < 1.9) {
                      outputId = 1;
                    } else if (value >= 2.0 && value < 2.9) {
                      outputId = 2;
                    } else if (value >= 3.0 && value < 3.9) {
                      outputId = 3;
                    } else if (value >= 4.0 && value < 4.9) {
                      outputId = 4;
                    }
                    generate();
                  });
                }),
            FlatButton(
              child: Container(
                height: screenHeightSize(30, context),
                width: screenWidthSize(100, context),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.red,
                      width: 3,
                    )),
                child: Center(child: Text("CALCULATE")),
              ),
              onPressed: () {
                setState(() {
                  onchange = true;
                });
                generate();
                if (_bitController.text == "") {
                  _toastInfo("Input field is empty");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
