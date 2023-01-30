import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:imc_app/constants/constants.dart';
import 'package:imc_app/models/imc_model.dart';
import 'package:imc_app/repositories/imc_repository.dart';

class ListImcPage extends StatefulWidget {
  const ListImcPage({super.key});

  @override
  State<ListImcPage> createState() => ListImcPageState();
}

class ListImcPageState extends State<ListImcPage> {
  late ImcRepository imcRepository;
  List resultadosSalvos = <ImcModel>[];
  @override
  void initState() {
    super.initState();
    carregarRepository();
  }

  carregarRepository() async {
    imcRepository = await ImcRepository.carregar();
    resultadosSalvos = imcRepository.obterDados();
    print(resultadosSalvos.length);   
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Constants constants = Constants(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        backgroundColor: constants.azulBackground,
        title: const Center(child: Text("IMCs salvos")),
      ),
      backgroundColor: constants.azulBackground,
      body: SizedBox(
        height: constants.heightPhone,
        child: ListView.builder(
            itemCount: resultadosSalvos.length,
            itemBuilder: (context, index) {
              ImcModel imc = resultadosSalvos[index];
              print(imc.genero);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: constants.cinzaOptionsClear,
                  textColor: constants.vermelhoPadrao,
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  trailing: Text(imc.imc.toStringAsFixed(2)),
                  title: Text(imc.nome),
                ),
              );
            }),
      ),
    ));
  }
}
