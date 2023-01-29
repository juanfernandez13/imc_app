import 'package:flutter/material.dart';
import '../constants/constants.dart';

class OptionGenders extends StatefulWidget {
  const OptionGenders({super.key});

  @override
  State<OptionGenders> createState() => _OptionGendersState();
}

class _OptionGendersState extends State<OptionGenders> {
  String gender = "";
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
              gender = gender == "male" ? "" : "male";
              setState(() {});
            },
            child: Card(
              color: gender == "male"
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
                gender = gender == "female" ? "" : "female";
                setState(() {});
              },
              child: Card(
                color: gender == "female"
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
