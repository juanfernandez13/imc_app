import 'dart:math';

class ImcModel {
  String _gender = "";
  double _altura = 120;
  int _peso = 40;
  int _idade = 0;
  double _imc = 0.0;

  ImcModel();

  String get gender => _gender;
  set gender(String gender) => _gender = gender;
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
