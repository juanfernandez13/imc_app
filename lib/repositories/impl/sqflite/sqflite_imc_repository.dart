import 'package:imc_app/repositories/imc_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import '../../../models/imc_model.dart';
import 'database.dart';
import 'package:flutter/material.dart';

class SqfliteImcRepository implements ImcRepository {
  SqfliteImcRepository();
  SqfliteImcRepository._criar();

  @override
  Future carregar() async{
    return SqfliteImcRepository._criar();
  }

  @override
  Future<List<ImcModel>> obterDados(String status) async {
    List<ImcModel> imcList = [];
    var db = await SQLiteDatabase().iniciarBancoDeDados();
    var result = await db.rawQuery(status == "Nenhum"
        ? 'SELECT id, nome, genero, altura, peso, idade, imc, status FROM imc'
        : 'SELECT id, nome, genero, altura, peso, idade, imc, status FROM imc WHERE status = \'$status\'');
    for (var element in result) {
      imcList.add(ImcModel.criar(
        element['nome'].toString(),
        element['genero'].toString(),
        double.parse(element['altura'].toString()),
        int.parse(element['peso'].toString()),
        int.parse(element['idade'].toString()),
        double.parse(element['imc'].toString()),
        element['status'].toString(),
      ));
    }
    return imcList;
  }

  @override
  Future<void> salvar(ImcModel imcModel) async {
    var db = await SQLiteDatabase().iniciarBancoDeDados();
    await db.rawInsert(
        'INSERT INTO imc (nome, genero, altura, peso, idade, imc, status) values (?,?,?,?,?,?,?)',
        [
          imcModel.nome,
          imcModel.genero,
          imcModel.altura,
          imcModel.peso,
          imcModel.idade,
          imcModel.imc,
          imcModel.status
        ]);
  }

  @override
  Future<void> alterar(ImcModel imcModel) async {
    var db = await SQLiteDatabase().iniciarBancoDeDados();
    await db.rawInsert(
        'UPDATE imc SET nome = ?, genero = ?, altura = ?, peso = ?, idade = ?, imc = ?, status = ? WHERE nome = ?, imc = ?, idade = ?',
        [
          imcModel.nome,
          imcModel.genero,
          imcModel.altura,
          imcModel.peso,
          imcModel.idade,
          imcModel.imc,
          imcModel.status,
          imcModel.nome,
          imcModel.imc,
          imcModel.idade,
        ]);
  }

  @override
  Future<void> excluir(ImcModel imcModel) async {
    var db = await SQLiteDatabase().iniciarBancoDeDados();
    await db.rawInsert(
        'DELETE FROM imc WHERE nome = ? AND imc = ? AND idade = ?',
        [imcModel.nome, imcModel.imc, imcModel.idade]);
  }
}
