import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:imc_app/constants/constants.dart';

class ListImcPage extends StatefulWidget {
  const ListImcPage({super.key});

  @override
  State<ListImcPage> createState() => ListImcPageState();
}

class ListImcPageState extends State<ListImcPage> {
  @override
  Widget build(BuildContext context) {
    Constants constants = Constants(context);
    
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: constants.azulBackground,
        title: const Center(child: Text("IMCs salvos")),
      ),
      backgroundColor: constants.azulBackground,
      body: SizedBox(
        height: constants.heightPhone,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,_) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: constants.cinzaOptionsClear,
              textColor: constants.vermelhoPadrao,
              leading: Icon(Icons.person, color: Colors.white,),
              trailing: Icon(Icons.usb_rounded, color: Colors.white,),
              title: Text("Juan"),
            ),
          );
        }),
      ),
    ));
  }
}
