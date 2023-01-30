import 'package:flutter/material.dart';
import 'package:imc_app/components/button_cal_imc.dart';
import 'package:imc_app/components/option_genders.dart';
import 'package:imc_app/components/option_height.dart';
import 'package:imc_app/components/options_age_weight.dart';
import 'package:imc_app/constants/constants.dart';
import 'package:imc_app/models/imc_model.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  @override
  Widget build(BuildContext context) {
    Constants constants = Constants(context);
    ImcModel imcModel = ImcModel();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            automaticallyImplyLeading:false,
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
