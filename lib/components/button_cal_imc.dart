import 'package:flutter/material.dart';
import '../constants/constants.dart';

class ButtonCalIMC extends StatefulWidget {
  const ButtonCalIMC({super.key});

  @override
  State<ButtonCalIMC> createState() => _ButtonCalIMCState();
}

class _ButtonCalIMCState extends State<ButtonCalIMC> {
  @override
  Widget build(BuildContext context) {
    Constants constants = Constants(context);
    return ElevatedButton(
        style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll(
              Size(constants.widthPhone, constants.heightPhone * 0.08)),
          backgroundColor:
              const MaterialStatePropertyAll<Color>(Color(0xFFDD1742)),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
        ),
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: constants.cinzaOptionsDeep,
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              builder: ((BuildContext bc) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            InkWell(
                              onTap: (() => Navigator.pop(context)),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                            const Center(
                              child: Text(
                                "Seu IMC",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    height: 0.01),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Card(
                        color: constants.cinzaOptionsClear,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Expanded(
                                  child: Text("Abaixo do peso",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    "15.27",
                                    style: TextStyle(
                                      fontSize: 45,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                      width: constants.widthPhone * 0.75,
                                      child: const Text(
                                        "Você está abaixo do peso. Melhor pensar em como melhorar sua alimentação",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      )),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(constants.vermelhoPadrao)),
                                            onPressed: () {},
                                            child: const Text(
                                              "Salvar",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        TextButton(
                                           style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(constants.vermelhoPadrao)),
                                            onPressed: () {},
                                            child: Text("Novo calculo",
                                                style: TextStyle(
                                                    color: Colors.white))),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                );
              }));
        },
        child: const Text("Cálcular IMC"));
  }
}
