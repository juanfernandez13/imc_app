import 'package:flutter/material.dart';
import 'package:imc_app/components/button_cal_imc.dart';
import 'package:imc_app/components/option_genders.dart';
import 'package:imc_app/components/option_height.dart';
import 'package:imc_app/components/options_age_weight.dart';
import 'package:imc_app/constants/constants.dart';
import 'package:imc_app/models/imc_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Constants constants = Constants(context);
    ImcModel imcModel = ImcModel();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: constants.azulBackground,
            title: const Center(
                child: Text(
              "Calculadora de IMC",
            ))),
        backgroundColor: constants.azulBackground,
        body: Center(
          child: SizedBox(
            height: constants.heightPhone,
            width: constants.widthPhone * 0.95,
            child: Column(
              children: [
                OptionGenders(imcModel),
                OptionHeight(imcModel),
                OptionsAgeWieght(imcModel),
                const SizedBox(height: 20),
                ButtonCalIMC(imcModel)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
