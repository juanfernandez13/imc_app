# Calculadora de Imc em Flutter

![linguagem](https://img.shields.io/github/languages/top/juanfernandez13/imc_app?color=blue&style=for-the-badge)
![tamanho do projeto](https://img.shields.io/github/languages/code-size/juanfernandez13/imc_app?color=blue&style=for-the-badge)
![tamanho do projeto](https://img.shields.io/github/last-commit/juanfernandez13/imc_app?color=blue&style=for-the-badge)

Aplicativo mobile híbrido para o calculo do Índice de Massa Corporal (IMC). Armazenando informações como altura, peso, idade, sexo e status. Para criar esse projeto foi utilizado a linguagem [Dart](https://dart.dev/) e o framework [Flutter](https://flutter.dev/). Como o objetivo da aplicação era treinar a persistência de dados localmente com FLutter, por isso foi criado uma classe abstrata chamada [ImcRepository](https://github.com/juanfernandez13/imc_app/blob/master/lib/repositories/imc_repository.dart) onde contém os principais métodos da aplicação e são implementadas nas classes [HiveImcModel](https://github.com/juanfernandez13/imc_app/blob/master/lib/repositories/impl/hive_imc_repository.dart) e [SqfliteImcModel](https://github.com/juanfernandez13/imc_app/blob/master/lib/repositories/impl/sqflite/sqflite_imc_repository.dart), que utiliza o banco NoSQL [Hive](https://pub.dev/packages/hive) e SQL [SQFFite](https://pub.dev/packages/sqflite). 

<p align="center">
  <img src="https://github.com/juanfernandez13/imc_app/blob/master/readme/Android-Emulator-Pixel_3_XL_API_30_5554-2023-02-01-18-08-53.gif" height=650/>
<p/>

<h2>
<img src="https://img.icons8.com/color/512/smartphone-tablet.png" height = 35/>
Telas do Aplicativo
</h2>

<p align="center">
  <img src = "https://github.com/juanfernandez13/imc_app/blob/master/readme/imcPage.png#vitrinedev" height=450/>
  <img src = "https://github.com/juanfernandez13/imc_app/blob/master/readme/modal.png"  height=450/>
  <img src = "https://github.com/juanfernandez13/imc_app/blob/master/readme/listPage.png"  height=450/>
<p/>

<h2>
<img src="https://img.icons8.com/fluency/512/wrench--v2.png" height = 35/>
Funcionalidades
</h2>

- [x] **Calcular IMC**:Realizar o calculo do imc com base nas informações selecionadas em cada componente.
- [x] **Alert Dialog**:Uso do Widget [AlertDialog](https://api.flutter.dev/flutter/material/AlertDialog-class.html) para gerar avisos e receber informações.
- [x] **Calculo do Peso ideal**:Usando um método na class ImcModel para calcular o intervalo entre o peso mínimo e máximo do peso ideal.
- [x] **Modal com o resultado**:Uso do Widget [showModalBottomSheet](https://api.flutter.dev/flutter/material/showModalBottomSheet.html) para apresentar o resultado do Imc.
- [x] **Filtro de pesquisa**:Listagem das leituras salvas filtrando o status do Imc.
- [x] **Persistência de dados**:Uso do package [Hive](https://pub.dev/packages/hive) e [SQFlite](https://pub.dev/packages/sqflite) para persistência dos dados.
- [x] **Criação de um Adapter**:Criação de um Adapter para o ImcModel com auxílio do [Hive Generator](https://pub.dev/packages/hive_generator) e o [Build Runner](https://pub.dev/packages/build_runner).
- [x] **Fácil navegação**: Uso dos Widgets [PageView](https://api.flutter.dev/flutter/widgets/PageView-class.html) e [BottomNavigationBar](https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html) para uma fácil navegação entre as telas.

<h2>
<img src="https://img.icons8.com/stickers/256/open-parcel.png" height = 35/>
Packages
</h2>

* [Hive](https://pub.dev/packages/hive)
* [Hive Generator](https://pub.dev/packages/hive_generator)
* [Build Runner](https://pub.dev/packages/build_runner)
* [SQFlite](https://pub.dev/packages/sqflite)

<h2>
<img src="https://img.icons8.com/nolan/256/blockchain-technology.png" height = 35/>
Hive x SQFlite
</h2>

<p>
O <a href="https://pub.dev/packages/hive">Hive</a> é um banco de dados local do tipo chave-valor leve e muito rápido, adaptado para todas as plataformas suportadas pelo <a href="https://flutter.dev/">Flutter</a>, Ele se utiliza do conceito de caixas, sendo que uma caixa não possuem uma estrutura fixa e podem conter qualquer tipo de dado que o programador desejar.
</p>

```dart
    //Um exemplo de como iniciar uma caixa com o Hive
    Future iniciarCaixa() async {
    if (Hive.isBoxOpen('imc')) {
      _box = Hive.box('imc');
    } else {
      _box = await Hive.openBox('imc');
    }
  }
```

<p>

<h4 align="center">
  1000 leituras x 1000 escritas
</h4>
<p align="center">
  <img src="https://raw.githubusercontent.com/hivedb/hive/master/.github/benchmark_read.png" height = 350/>
  <img src="https://raw.githubusercontent.com/hivedb/hive/master/.github/benchmark_write.png" height = 350/>
</p>

Com base no Benchmark disponível na documentação do hive, percebemos o quão grande é a diferença de perfomance do Hive entre seus princípais concorrentes como o SharedPreferences e o SQFlite, principalmente em momentos de escrita.

Já o <a href="https://pub.dev/packages/sqflite">SQFlite</a> é um banco de dados SQL, ou seja, um banco de dados mais tradicional formado por tabelas e colunas fixas, onde são armazenadas informações. Diferente do Hive o SQFlite não possui suporte para todas as plataformas onde o flutter <a href="https://flutter.dev/">Flutter</a>. Além disso o SQFlite possui mais linhas de códigos e comandos funcionar, sendo assim, acaba sendo mais dificultoso seu aprendizado se comparado com o Hive.
</p>

```dart
  //Um exemplo de como iniciar uma Tabela com o SQFlite
  Map<int, String> scripts = {
  1: '''CREATE TABLE imc (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    genero TEXT,
    altura INTEGER,
    peso INTEGER,
    imc REAL,
    status TEXT,
  );''',
};

  static Database? db;

  Future<Database> obterDatabase() async {
    if (db == null) {
      return await iniciarBancoDeDados();
    } else {
      return db!;
    }
  }

  Future iniciarBancoDeDados() async {
    var db = openDatabase(path.join(await getDatabasesPath(), 'databaseImc.db'),
        version: scripts.length, onCreate: (Database db, int index) async {
      for (var i = 1; i <= scripts.length; i++) {
        await db.execute(scripts[i]!);
        debugPrint(scripts[i]);
      }
    }, onUpgrade: (Database db, int oldVersion, int newVesion) async {
      for (var i = oldVersion + 1; i <= scripts.length; i++) {
        await db.execute(scripts[i]!);
        debugPrint(scripts[i]);
      }
    });
    return db;
  }
```

<p>
Por fim, ambos bancos necessitam de outros packages para criar caminho ao diretório. No caso foi utilizado o <a href="https://pub.dev/packages/path_provider">Path Provider</a>. Para o Hive ainda houve a adição de 2 outros packages para facilitar a criação de um objeto que possa ser armazenado na caixa, foi utilizado o <a href="https://pub.dev/packages/hive_generator">Hive Generator</a> com o <a href="https://pub.dev/packages/build_runner">Build Runner</a> para gerar o código de um adapter para a classe que seria armazenada.
</p>

<h2>
<img src="https://img.icons8.com/nolan/256/cubes.png" height = 35/>
Widgets
</h2>

* [Container](https://api.flutter.dev/flutter/widgets/Container-class.html)
* [SizedBox](https://api.flutter.dev/flutter/widgets/SizedBox-class.html)
* [Card](https://api.flutter.dev/flutter/material/Card-class.html)
* [Center](https://api.flutter.dev/flutter/widgets/Center-class.html)
* [Padding](https://api.flutter.dev/flutter/widgets/Padding-class.html)
* [Text](https://api.flutter.dev/flutter/widgets/Text-class.html)
* [Icon](https://api.flutter.dev/flutter/widgets/Icon-class.html)
* [Column](https://api.flutter.dev/flutter/widgets/Column-class.html)
* [Row](https://api.flutter.dev/flutter/widgets/Row-class.html)
* [Expanded](https://api.flutter.dev/flutter/widgets/Expanded-class.html)
* [ListView.builder](https://api.flutter.dev/flutter/widgets/ListView/ListView.builder.html)
* [ListTile](https://api.flutter.dev/flutter/material/ListTile-class.html)
* [SafeArea](https://api.flutter.dev/flutter/widgets/SafeArea-class.html)
* [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html)
* [PageView](https://api.flutter.dev/flutter/widgets/PageView-class.html)
* [BottomNavigationBar](https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html)
* [CircleAvatar](https://api.flutter.dev/flutter/material/CircleAvatar-class.html)
* [TextField](https://api.flutter.dev/flutter/material/TextField-class.html)
* [TextButton](https://api.flutter.dev/flutter/material/TextButton-class.html)
* [Inkwell](https://api.flutter.dev/flutter/material/InkWell-class.html)
* [AlertDialog](https://api.flutter.dev/flutter/material/AlertDialog-class.html)
* [ElevatedButton](https://api.flutter.dev/flutter/material/ElevatedButton-class.html)
* [Dismissible](https://api.flutter.dev/flutter/widgets/Dismissible-class.html)
