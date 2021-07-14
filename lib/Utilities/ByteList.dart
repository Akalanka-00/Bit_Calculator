import 'package:bit_calculator/Screens/ByteScreens/Byte_Byte.dart';
import 'package:bit_calculator/Screens/ByteScreens/Byte_bit.dart';
import 'package:bit_calculator/Screens/ByteScreens/bit_Byte.dart';
import 'package:bit_calculator/Screens/ByteScreens/bit_bit.dart';
import 'package:flutter/material.dart';

class Byte {
  String title;
  Widget navigationScreen;

  Byte({
    this.title,
    this.navigationScreen,
  });

  static List<Byte> byteList = [
    Byte(
      navigationScreen: ByteByteScreen(),
      title: "Byte - Byte",
    ),
    Byte(
      navigationScreen: ByteBitScreen(),
      title: "Byte - bit",
    ),
    Byte(
      navigationScreen: BitByteScreen(),
      title: "bit-Byte",
    ),
    Byte(
      navigationScreen: BitBitScreen(),
      title: "bit - bit",
    ),
    
  ];
}

class ByteList {
  String title;
  int value;

  ByteList({
    this.title,
    this.value,
  });

  static List<ByteList> byteList = [
    ByteList(title: "Byte", value: 1),
    ByteList(
      title: "KB",
      value: 2,
    ),
    ByteList(title: "MB", value: 3),
    ByteList(title: "GB", value: 4),
    ByteList(title: "TB", value: 5),
  ];
  static List<ByteList> bitList = [
    ByteList(title: "bit", value: 1),
    ByteList(
      title: "Kb",
      value: 2,
    ),
    ByteList(title: "Mb", value: 3),
    ByteList(title: "Gb", value: 4),
    ByteList(title: "Tb", value: 5),
  ];
}
