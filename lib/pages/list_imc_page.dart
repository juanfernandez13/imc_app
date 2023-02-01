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
    carregarRepository("Nenhum");
  }

  carregarRepository(String status) async {
    imcRepository = await ImcRepository.carregar();
    resultadosSalvos = imcRepository.obterDados(status);
    setState(() {});
  }

  List<String> filtroImc = [
    "Nenhum",
    "Abaixo do peso",
    "Peso ideal",
    "sobrepeso",
    "obesidade grau I",
    "obesidade grau II",
  ];

  String filtro = "Nenhum";

  @override
  Widget build(BuildContext context) {
    Constants constants = Constants(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: constants.azulBackground,
        title: const Center(child: Text("IMCs salvos")),
      ),
      backgroundColor: constants.azulBackground,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  "Filtro: ",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Expanded(
                  // width: constants.widthPhone*0.9,
                  child: DropdownButton(
                      iconEnabledColor: constants.vermelhoPadrao,
                      dropdownColor: constants.cinzaOptionsDeep,
                      isExpanded: true,
                      value: filtro,
                      items: filtroImc.map((filtro) {
                        return DropdownMenuItem(
                            value: filtro,
                            child: Text(
                              filtro,
                              style: const TextStyle(color: Colors.white),
                            ));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          filtro = value.toString();
                          carregarRepository(filtro);
                        });
                      }),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: resultadosSalvos.length,
                itemBuilder: (context, index) {
                  ImcModel imc = resultadosSalvos[index];
                  Color imcColor;
                  if (imc.imc <= 18.50) {
                    imcColor = Colors.orange;
                  } else if (imc.imc <= 25) {
                    imcColor = Colors.green;
                  } else if (imc.imc <= 30) {
                    imcColor = Colors.orange;
                  } else if (imc.imc <= 35) {
                    imcColor = Colors.redAccent;
                  } else {
                    imcColor = const Color.fromARGB(255, 230, 3, 3);
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Dismissible(
                      key: Key(imc.nome + imc.genero + imc.imc.toString()),
                      onDismissed: (DismissDirection direction) async {
                        imcRepository.excluir(imc);
                        carregarRepository(filtro);
                      },
                      direction: DismissDirection.startToEnd,
                      background: Container(
                        color: constants.vermelhoPadrao,
                        child: const Align(
                          alignment: Alignment(-0.9, 0.0),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: ListTile(
                        tileColor: constants.cinzaOptionsClear,
                        textColor: constants.vermelhoPadrao,
                        leading: CircleAvatar(
                          backgroundColor: constants.cinzaOptionsClear,
                          child: Icon(
                            imc.genero == "male" ? Icons.man : Icons.woman,
                            color: Colors.white,
                          ),
                        ),
                        trailing: Card(
                          color: constants.cinzaOptionsClear,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${imc.imc.toStringAsFixed(2)}",
                              style: TextStyle(color: imcColor, fontSize: 16),
                            ),
                          ),
                        ),
                        title: Text(imc.nome),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    ));
  }
}
