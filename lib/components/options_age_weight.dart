import 'package:flutter/material.dart';
import 'package:imc_app/constants/constants.dart';

import '../models/imc_model.dart';

class OptionsAgeWieght extends StatefulWidget {
  final ImcModel imcModel;
  const OptionsAgeWieght(this.imcModel, {super.key});

  @override
  State<OptionsAgeWieght> createState() => _OptionsAgeWieghtState();
}

class _OptionsAgeWieghtState extends State<OptionsAgeWieght> {
  @override
  Widget build(BuildContext context) {
    Constants constants = Constants(context);
    return Expanded(
        child: SizedBox(
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
                  child: Text("Peso",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white30,
                          fontWeight: FontWeight.w300)),
                ),
                Text(
                  widget.imcModel.peso.toString(),
                  style: const TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            ++widget.imcModel.peso;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: constants.vermelhoPadrao,
                          child: const Icon(Icons.add),
                        )),
                    InkWell(
                        onTap: () {
                          setState(() {
                            --widget.imcModel.peso;
                          });
                        },
                        child: CircleAvatar(
                            backgroundColor: constants.vermelhoPadrao,
                            child: const Icon(Icons.remove))),
                  ],
                )
              ],
            ),
          )),
          Expanded(
              child: Card(
            color: constants.cinzaOptionsClear,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Idade",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white30,
                          fontWeight: FontWeight.w300)),
                ),
                Text(
                  widget.imcModel.idade.toString(),
                  style: const TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () => setState(() => ++widget.imcModel.idade),
                        child: CircleAvatar(
                          backgroundColor: constants.vermelhoPadrao,
                          child: const Icon(Icons.add),
                        )),
                    InkWell(
                        onTap: () => setState(() => --widget.imcModel.idade),
                        child: CircleAvatar(
                            backgroundColor: constants.vermelhoPadrao,
                            child: const Icon(Icons.remove))),
                  ],
                )
              ],
            ),
          )),
        ],
      ),
    ));
  }
}
