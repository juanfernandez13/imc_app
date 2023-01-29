import 'package:flutter/material.dart';

class Constants {
  late final Color azulBackground;
  late final Color cinzaOptions;
  late final Color vermelhoPadrao;
  late final double widthPhone;
  late final double heightPhone;
  Constants(BuildContext context) {
    azulBackground = const Color(0xff000010);
    cinzaOptions = const Color(0x1FAEAEAE);
    vermelhoPadrao = const Color(0xFFDD1742);
    widthPhone = MediaQuery.of(context).size.width;
    heightPhone = MediaQuery.of(context).size.height;
  }
}
