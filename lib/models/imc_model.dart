import 'dart:math';
import 'package:hive/hive.dart';
part 'imc_model.g.dart';

@HiveType(typeId: 0)
class ImcModel extends HiveObject {
  @HiveField(0)
  String _nome = "";
  @HiveField(1)
  String _genero = "";
  @HiveField(2)
  double _altura = 120;
  @HiveField(3)
  int _peso = 40;
  @HiveField(4)
  int _idade = 20;
  @HiveField(5)
  double _imc = 0.0;

  ImcModel();
  ImcModel.criar(
    this._nome,
    this._genero,
    this._altura,
    this._peso,
    this._idade,
    this._imc,
  );

  String get genero => _genero;
  set genero(String gender) => _genero = gender;
  String get nome => _nome;
  set nome(String nome) => _nome = nome;
  double get altura => _altura;
  set altura(double altura) => _altura = altura;
  int get peso => _peso;
  set peso(int peso) => _peso = peso;
  int get idade => _idade;
  set idade(int idade) => _idade = idade;
  double get imc => _imc;
  set imc(double imc) => _imc = imc;

  double calcularImc() {
    double altura = _altura.floor() / 100.0;
    var imcValue = _peso / ((altura * altura));
    return imcValue;
  }

  double pesoIdealMaximo() {
    double maxPeso;
    double altura = _altura.floor() / 100.0;
    maxPeso = 25 * altura * altura;
    return maxPeso;
  }

  double pesoIdealMinimo() {
    double minPeso;
    double altura = _altura.floor() / 100.0;
    minPeso = 18.5 * altura * altura;
    return minPeso;
  }
}
