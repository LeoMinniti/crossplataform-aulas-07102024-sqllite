import 'package:rm76172/database/scripts.dart';
import 'package:rm76172/domain/task.dart';
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart"; // adicionado para reconhecer o JOIN

class  TaskDatabase {
  //Instancia unica da database (singleton)
  static final TaskDatabase instance = TaskDatabase._init(); // metodo iniciando com "_" sao metodos privados

  //
  static Database? _database;

  TaskDatabase._init(); // metodo iniciando com "_" sao metodos privados

  Future<Database> get database async {
    if(_database != null){
      return _database!; //retornando a instancia ja criada; "!" é para garantir que o atributo não é nulo, forcar isso!
    }

    _database = await _initDatabase("AppSQLite");

    return _database!; //"!" é para garantir que o atributo não é nulo, forcar isso!

  }

  Future<Database> _initDatabase(String filePath) async { //filePath é o nome do camiho do banco de dados
    final dbPath = await getDatabasesPath(); // pegando o caminho onde seu app foi instalado
    final pathLocal = join(dbPath, filePath); //caminho + nome do banco de dados

    return await openDatabase(
        pathLocal
        , version: 1
        , onCreate: _onCreate //Quando voce cria uma funcao e chama ela pelo nome o Flutter subentende os parentes e os parametros
    ); //versao do banco de dados = 1;

  }

  Future<void> _onCreate(Database db, int version) async{
   await db.execute(createTable);
  }

  Future<int> insert(Task value) async{
    final db = await instance.database; // obtendo a cnexão com o BD
    return db.insert("tasks", value.toJson() ); // inserindo valores na tabela tasks
  }

}

