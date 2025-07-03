import '../assets/import_export.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> initDb() async {
    if (_db != null) return _db!;
    String path = join(await getDatabasesPath(), 'Student.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE TBL_Student (
          enrollment INTEGER PRIMARY KEY,
          name TEXT NOT NULL,
          age INTEGER NOT NULL,
          branch TEXT NOT NULL,
          gender TEXT NOT NULL,
          sem INTEGER NOT NULL,
          university TEXT NOT NULL,
          city TEXT NOT NULL
          )
        ''');
      },
    );
    return _db!;
  }

  static Future<Database> get db async => _db ??= await initDb();
}
