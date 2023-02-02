import '../models/imc_model.dart';

abstract class ImcRepository {
  Future carregar();
  salvar(ImcModel imcModel);
  alterar(ImcModel imcModel);
  excluir(ImcModel imcModel);
  Future<List<ImcModel>> obterDados(String status);
}
