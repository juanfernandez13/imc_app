import 'package:flutter/material.dart';

class Constants {
  late final Color azulBackground;
  late final Color cinzaOptionsClear;
  late final Color cinzaOptionsDeep;
  late final Color vermelhoPadrao;
  late final double widthPhone;
  late final double heightPhone;
  Constants(BuildContext context) {
    azulBackground = const Color(0xff000010);
    cinzaOptionsClear = const Color(0x1FAEAEAE);
    cinzaOptionsDeep = const Color(0xff15151F);
    vermelhoPadrao = const Color(0xFFDD1742);
    widthPhone = MediaQuery.of(context).size.width;
    heightPhone = MediaQuery.of(context).size.height;
  }
}
