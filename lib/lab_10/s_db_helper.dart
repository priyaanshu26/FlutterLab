import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 's_model.dart';

class DBHelperS {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  static Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'students.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE students(
            enrollment INTEGER PRIMARY KEY,
            name TEXT,
            age INTEGER,
            branch TEXT,
            gender TEXT,
            sem INTEGER,
            university TEXT,
            city TEXT
          )
        ''');
      },
    );
  }

  static Future<int> insertStudent(StudentS student) async {
    final db = await database;
    return await db.insert('students', student.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<StudentS>> fetchStudents({int limit = 10, int offset = 0}) async {
    final db = await database;
    final data = await db.query('students', limit: limit, offset: offset);
    return data.map((e) => StudentS.fromMap(e)).toList();
  }

  static Future<int> updateStudent(StudentS student) async {
    final db = await database;
    return await db.update('students', student.toMap(), where: 'enrollment = ?', whereArgs: [student.enrollment]);
  }

  static Future<int> deleteStudent(int enrollment) async {
    final db = await database;
    return await db.delete('students', where: 'enrollment = ?', whereArgs: [enrollment]);
  }

  static Future<List<StudentS>> searchStudent(String query) async {
    final db = await database;
    final result = await db.query(
      'students',
      where: 'name LIKE ? OR city LIKE ? OR branch LIKE ?',
      whereArgs: ['%$query%', '%$query%', '%$query%'],
    );
    return result.map((e) => StudentS.fromMap(e)).toList();
  }
}
