import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider _dbHelper = DBProvider._internal();

  DBProvider._internal();

  factory DBProvider() {
    return _dbHelper;
  }
  static Database? _db;
  Future<Database> get database async => _db ??= await initDB();

  static const bardlyMessage =
      """
create table bardly_message(
id integer NOT NULL PRIMARY KEY autoincrement,
sender varchar(1) NOT NULL,
message varchar(5000) NOT NULL,
created_at TEXT DEFAULT CURRENT_TIMESTAMP,
room_id integer,
CONSTRAINT bardly_room_id
	FOREIGN KEY(room_id)
		REFERENCES bardly_room(id)

);""";
  static const bardlyRoom = """
create table bardly_room(
id integer NOT NULL PRIMARY KEY autoincrement,
header varchar(255) NOT NULL,
created_at TEXT DEFAULT CURRENT_TIMESTAMP
);""";

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), "creatorium_bardly.db");
    await deleteDatabase(path);
    print(path);
    return await openDatabase(path, version: 2, onCreate: (Database db, int version) async {
      await db.execute(bardlyRoom);
      await db.execute(bardlyMessage);
    });
  }

  insertRoomTable(String header) async {
    final db = await database;
    await db.insert('bardly_room', {
      'header': header,
    });
  }

  getRoomHeader() async {
    final db = await database;

    List<Map> result = await db.rawQuery('select id,header from bardly_room');

    return result;
  }

  getLastHeaderId() async {
    final db = await database;

    List<Map> result = await db.rawQuery('select id from bardly_room order by created_at desc limit 1');

    return result;
  }

  getRecentChat(int id) async {
    final db = await database;

    List<Map> result = await db.rawQuery('select * from bardly_message where room_id = $id');

    return result;
  }

  insertChat(String sender, String message, int roomId) async {
    final db = await database;
    await db.insert('bardly_message', {
      'sender': sender,
      'message': message,
      'room_id': roomId,
    });
  }
}
