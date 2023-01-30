import 'package:flutter/material.dart';
import 'package:imc_app/models/imc_model.dart';
import 'package:imc_app/pages/home_page.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDiractory = await path_provider.getApplicationSupportDirectory();
  Hive.init(documentsDiractory.path);
  Hive.registerAdapter(ImcModelAdapter());
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
