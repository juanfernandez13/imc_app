import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:imc_app/constants/constants.dart';

class ListImcPage extends StatefulWidget {
  const ListImcPage({super.key});

  @override
  State<ListImcPage> createState() => ListImcPageState();
}

class ListImcPageState extends State<ListImcPage> {
  @override
  Widget build(BuildContext context) {
    Constants constants = Constants(context);
    return SafeArea(
        child: Scaffold(
          backgroundColor: constants.azulBackground,
      body: Container(),
    ));
  }
}
