import 'package:flutter/material.dart';
import 'package:imc_app/models/imc_model.dart';
import '../constants/constants.dart';

class OptionGenders extends StatefulWidget {
  final ImcModel imcModel;
  OptionGenders(this.imcModel, {super.key});

  @override
  State<OptionGenders> createState() => _OptionGendersState();
}

class _OptionGendersState extends State<OptionGenders> {
  @override
  Widget build(BuildContext context) {
    Constants constants = Constants(context);

    return Expanded(
        child: SizedBox(
      child: Row(
        children: [
          Expanded(
              child: InkWell(
            onTap: () {
              setState(() {
                widget.imcModel.genero =
                    widget.imcModel.genero == "male" ? "" : "male";
              });
            },
            child: Card(
              color: widget.imcModel.genero == "male"
                  ? constants.vermelhoPadrao
                  : constants.cinzaOptionsClear,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.male,
                    size: 80,
                    color: Colors.white,
                  ),
                  Text("Homem",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white30,
                          fontWeight: FontWeight.w300))
                ],
              ),
            ),
          )),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  widget.imcModel.genero =
                      widget.imcModel.genero == "female" ? "" : "female";
                });
              },
              child: Card(
                color: widget.imcModel.genero == "female"
                    ? constants.vermelhoPadrao
                    : constants.cinzaOptionsClear,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.female_outlined,
                      size: 80,
                      color: Colors.white,
                    ),
                    Text("Mulher",
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.white30,
                            fontWeight: FontWeight.w300))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
