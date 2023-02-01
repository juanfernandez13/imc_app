import 'package:flutter/material.dart';
import 'package:imc_app/pages/home_page.dart';
import 'package:imc_app/pages/imc_page.dart';
import 'package:imc_app/repositories/imc_repository.dart';
import '../constants/constants.dart';
import '../models/imc_model.dart';

class ButtonCalIMC extends StatefulWidget {
  final ImcModel imcModel;
  ButtonCalIMC(this.imcModel, {super.key});

  @override
  State<ButtonCalIMC> createState() => _ButtonCalIMCState();
}

class _ButtonCalIMCState extends State<ButtonCalIMC> {
  late double imc;
  TextEditingController nomeController = TextEditingController(text: "");
  List<String> statusImc = [
    "Abaixo do peso",
    "Peso ideal",
    "sobrepeso",
    "obesidade grau I",
    "obesidade grau II",
  ];
  List<String> textStatusImc = [
    "Sinto muito, mas seu IMC está acima do ideal. Melhor pensar em como melhorar sua alimentação",
    "Parábens, você está no seu peso ideal. Continue mantendo cuidado com sua alimentação e atividades físicas",
    "Sinto muito, mas seu IMC está acima do ideal. Melhor pensar em como melhorar sua alimentação",
    "Sinto muito, mas seu IMC está muito acima do ideal. Melhor pensar em como melhorar sua alimentação e atividades físicas",
    "Seu IMC está muito acima do ideal. Melhor pensar em como melhorar sua alimentação e atividades físicas com urgência",
  ];
  int indexText = 0;
  List<Color> colorStatusImc = [
    Colors.orange,
    Colors.green,
    Colors.orange,
    Colors.redAccent,
    Color.fromARGB(255, 230, 3, 3)
  ];

  late ImcRepository imcRepository;

  @override
  void initState() {
    super.initState();
    carregarRepository();
  }

  void carregarRepository() async {
    imcRepository = await ImcRepository.carregar();
  }

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
          widget.imcModel.imc = widget.imcModel.calcularImc();
          imc = widget.imcModel.imc;
          if (imc <= 18.50) {
            indexText = 0;
          } else if (imc <= 25) {
            indexText = 1;
          } else if (imc <= 30) {
            indexText = 2;
          } else if (imc <= 35) {
            indexText = 3;
          } else {
            indexText = 4;
          }
          setState(() {});
          widget.imcModel.genero == ""
              ? showDialog(
                  context: context,
                  builder: ((BuildContext bc) {
                    return AlertDialog(
                      
                      backgroundColor: constants.cinzaOptionsDeep,
                      alignment: Alignment.centerLeft,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: const Text("Meu IMC",
                          style: TextStyle(color: Colors.white)),
                      content: Wrap(
                        children: const [
                          Text(
                            "Você precisa selecionar um sexo",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  constants.vermelhoPadrao),
                            ),
                            onPressed: (() => Navigator.pop(context)),
                            child: const Text(
                              "Ok",
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    );
                  }))
              : showModalBottomSheet(
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
                                    Expanded(
                                      child: Text(statusImc[indexText],
                                          style: TextStyle(
                                              color: colorStatusImc[indexText],
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          Text(
                                            imc.toStringAsFixed(2),
                                            style: const TextStyle(
                                              fontSize: 45,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "Seu peso ideal: ${widget.imcModel.pesoIdealMinimo().toStringAsFixed(2)} - ${widget.imcModel.pesoIdealMaximo().toStringAsFixed(2)} kg",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.green,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                          width: constants.widthPhone * 0.75,
                                          child: Text(
                                            textStatusImc[indexText],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
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
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll<
                                                                Color>(
                                                            constants
                                                                .vermelhoPadrao)),
                                                onPressed: () {
                                                  ImcModel salvarImc = widget.imcModel;
                                                  Navigator.pop(context);
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          ((BuildContext bc) {
                                                        return AlertDialog(
                                                          backgroundColor: constants
                                                              .cinzaOptionsDeep,
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          elevation: 8,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          title: const Text(
                                                              "Digite o seu nome",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                          content: Wrap(
                                                            children: [
                                                              TextField(
                                                                onChanged:
                                                                    (String
                                                                        value) {
                                                                  salvarImc.nome =nomeController
                                                                          .text;
                                                                },
                                                                controller:
                                                                    nomeController,
                                                                decoration:
                                                                    const InputDecoration(
                                                                  hintText:
                                                                      "Nome",
                                                                  hintStyle: TextStyle(
                                                                      color: Colors
                                                                          .white30),
                                                                ),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ],
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                                style:
                                                                    ButtonStyle(
                                                                  backgroundColor: MaterialStatePropertyAll<
                                                                          Color>(
                                                                      constants
                                                                          .vermelhoPadrao),
                                                                ),
                                                                onPressed: (() {
                                                                  imcRepository.salvar(ImcModel.criar(
                                                                      salvarImc
                                                                          .nome,
                                                                      salvarImc
                                                                          .genero,
                                                                      salvarImc
                                                                          .altura,
                                                                      salvarImc
                                                                          .peso,
                                                                      salvarImc
                                                                          .idade,
                                                                      salvarImc
                                                                          .imc,
                                                                         statusImc[indexText] ));
                                                                  Navigator.pushReplacement(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (_) =>
                                                                              HomePage()));
                                                                }),
                                                                child:
                                                                    const Text(
                                                                  "Salvar",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                )),
                                                          ],
                                                        );
                                                      }));
                                                },
                                                child: const Text(
                                                  "Salvar",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                            TextButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll<
                                                                Color>(
                                                            constants
                                                                .vermelhoPadrao)),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              HomePage()));
                                                },
                                                child: const Text(
                                                    "Novo calculo",
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
        child: const Text("Calcular IMC"));
  }
}
