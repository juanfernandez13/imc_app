import 'package:flutter/material.dart';
import 'dart:math';

import '../constants/constants.dart';

class OptionHeight extends StatefulWidget {
  const OptionHeight({super.key});

  @override
  State<OptionHeight> createState() => _OptionHeightState();
}

class _OptionHeightState extends State<OptionHeight> {
  double valueSlider = 100;
  @override
  Widget build(BuildContext context) {
    Constants constants = Constants(context);
    return Expanded(
        child: Row(
      children: [
        Expanded(
            child: Card(
          color: constants.cinzaOptionsClear,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Altura",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white30,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${valueSlider.floor()}",
                    style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 0.8),
                  ),
                  Text(
                    " cm",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white30,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Slider(
                value: valueSlider,
                max: 230,
                min: 100,
                onChanged: (double value) {
                  setState(() {
                    valueSlider = value;
                  });
                },
                thumbColor: constants.vermelhoPadrao,
                activeColor: Colors.white,
                inactiveColor: Colors.white30,
              )
            ],
          ),
        )),
      ],
    ));
  }
}
