import 'package:hive/hive.dart';
import 'package:imc_app/models/imc_model.dart';

class ImcRepository {
  static late Box _box;
  ImcRepository._criar();

  static Future<ImcRepository> carregar() async {
    if (Hive.isBoxOpen('imc')) {
      _box = Hive.box('imc');
    } else {
      _box = await Hive.openBox('imc');
    }

    return ImcRepository._criar();
  }

  salvar(ImcModel imcModel) => _box.add(imcModel);
  alterar(ImcModel imcModel) => imcModel.save();
  excluir(ImcModel imcModel) => imcModel.delete();
  List<ImcModel> obterDados(String status) => _box.values
      .cast<ImcModel>()
      .where((element) => status == "Nenhum" ? true : element.status == status)
      .toList();
}
