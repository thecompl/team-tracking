import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'myteam';
  static final table2 = 'notification';

  static final id = 'id';
  static final teamid = 'teamid';
  static final teamname = 'teamname';
  static final team1 = 'team1';
  static final team2 = 'team2';
  static final leuge_name = 'leuge_name';
  static final gamename = 'gamename';
  static final countryname = 'countryname';
  static final tapped = 'tapped';
  static final fav ='fav';
  static final date ='date';

  static final game_id ='game_id';
  static final time ='time';
  static final notifytime ='notifytime';




  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $id INTEGER PRIMARY KEY AUTOINCREMENT,
            $teamid INTEGER NOT NULL UNIQUE,
            $gamename TEXT NOT NULL,
            $teamname TEXT NOT NULL,
            $countryname TEXT NOT NULL,
            $fav INTEGER NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $table2(
            $id INTEGER PRIMARY KEY AUTOINCREMENT,
            $game_id INTEGER NOT NULL UNIQUE,
            $gamename TEXT NOT NULL,
            $team1 TEXT NOT NULL,
            $team2 TEXT NOT NULL,
            $leuge_name TEXT NOT NULL,
            $time TEXT NOT NULL,
            $notifytime TEXT NOT NULL,
            $date TEXT NOT NULL,
            $tapped  INTEGER NOT NULL 
           )''');
  }


  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(table, row);
  }
  Future<int> inserttable2(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(table2, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }

  Future<List<Map<String, dynamic>>> queryAllRowstable2() async {
    Database? db = await instance.database;
    return await db!.query(table2);
  }
  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRowswhere(String gamenam) async {
    Database? db = await instance.database;
    return await db!.query(table,where: '$gamename = ?', whereArgs: [gamenam]);
  }
  Future<List<Map<String, dynamic>>> queryAllRowswherefav() async {
    Database? db = await instance.database;
    return await db!.query(table,where: '$fav = ?', whereArgs:["1"]);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    return Sqflite.firstIntValue(await db!.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(int fave,int ids) async {
    Database? db = await instance.database;
    return await await db!.rawUpdate('UPDATE $table SET $fav = ? WHERE $id = ?', [fave, ids]);
  }
  Future<int> updatetable2(int tapped,int ids) async {
    Database? db = await instance.database;
    return await await db!.rawUpdate('UPDATE $table2 SET $tapped = ? WHERE $id = ?', [tapped, ids]);
  }


  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int ids) async {
    Database? db = await instance.database;
    return await db!.delete(table2, where: '$id = ?', whereArgs:[ids]);
  }
  Future<int> deleteall() async {
    Database? db = await instance.database;
    return await db!.delete(table2);
  }
}