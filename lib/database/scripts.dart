const createTable = '''
CREATE TABLE tasks(
  id INTEGER AUTOINCREMENT PRIMARY KEY NOT NULL
  , content TEXT NOT NULL 
  , status INTEGER NOT NULL
);
''';

const tableName = "tasks";

// FUTURAMENTE PODEMOS TRAZER O NOME DO BANCO DE DADOS PRA CA...