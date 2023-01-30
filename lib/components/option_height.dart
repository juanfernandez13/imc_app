import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/imc_model.dart';

class OptionHeight extends StatefulWidget {
  final ImcModel imcModel;
  OptionHeight(this.imcModel, {super.key});

  @override
  State<OptionHeight> createState() => _OptionHeightState();
}

class _OptionHeightState extends State<OptionHeight> {
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
                    "${widget.imcModel.altura.floor()}",
                    style: const TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 0.8),
                  ),
                  const Text(
                    " cm",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white30,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Slider(
                value: widget.imcModel.altura,
                max: 230,
                min: 100,
                onChanged: (double value) {
                  setState(() {
                    widget.imcModel.altura = value;
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
