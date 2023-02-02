import 'package:hive/hive.dart';
import 'package:imc_app/models/imc_model.dart';
import 'package:imc_app/repositories/imc_repository.dart';

class HiveImcRepository implements ImcRepository {
  static late Box _box;
  HiveImcRepository();
  HiveImcRepository._criar();
  @override
  Future carregar() async {
    if (Hive.isBoxOpen('imc')) {
      _box = Hive.box('imc');
    } else {
      _box = await Hive.openBox('imc');
    }

    return HiveImcRepository._criar();
  }
  @override
  salvar(ImcModel imcModel) => _box.add(imcModel);
  @override
  alterar(ImcModel imcModel) => imcModel.save();
  @override
  excluir(ImcModel imcModel) => imcModel.delete();
  @override
  //para adaptar o sqflite na class ImcRepository
  Future<List<ImcModel>> obterDados(String status) async => _box.values
      .cast<ImcModel>()
      .where((element) => status == "Nenhum" ? true : element.status == status)
      .toList();
}
