import 'package:schoolmanagement/shopping/card_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

// for create table in database

  _onCreate(Database db, int version) async {
    await db.execute('drop table cart');
    await db.execute(
        'CREATE TABLE cart(id INTEGER PRIMARY KEY AUTOINCREMENT,productId VARCHAR UNIQUE,productName TEXT,'
        'initialPrice INTEGER,productPrice INTEGER,quantity INTEGER, unitTag TEXT,image TEXT)');
  }

  // now insert data in table

  Future<Cart> insert(Cart cart) async {
    var dbClient = await db;
    if (dbClient != null) {
      await dbClient.insert('cart', cart.toMap());
    }
    return cart;
  }
}
