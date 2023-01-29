import 'package:flutter/material.dart';
import 'package:imc_app/constants/constants.dart';

class OptionsAgeWieght extends StatefulWidget {
  const OptionsAgeWieght({super.key});

  @override
  State<OptionsAgeWieght> createState() => _OptionsAgeWieghtState();
}

class _OptionsAgeWieghtState extends State<OptionsAgeWieght> {
  int weight = 60;
  int age = 20;
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
                  weight.toString(),
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
                        onTap: () => setState(() => ++weight),
                        child: CircleAvatar(
                          backgroundColor: constants.vermelhoPadrao,
                          child: const Icon(Icons.add),
                        )),
                    InkWell(
                        onTap: () => setState(() => --weight),
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
                  age.toString(),
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
                        onTap: () => setState(() => ++age),
                        child: CircleAvatar(
                          backgroundColor: constants.vermelhoPadrao,
                          child: const Icon(Icons.add),
                        )),
                    InkWell(
                        onTap: () => setState(() => --age),
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
