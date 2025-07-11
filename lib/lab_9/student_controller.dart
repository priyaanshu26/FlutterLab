import '../assets/import_export.dart';

class StudentController extends GetxController {
  RxList<Student> students = <Student>[].obs;

  Future<void> fetchStudents() async {
    final db = await DBHelper.db;
    final List<Map<String, dynamic>> result = await db.query('TBL_Student');
    students.value = result.map((e) => Student.fromMap(e)).toList();
  }

  Future<void> insertStudent(Student student) async {
    final db = await DBHelper.db;
    await db.insert('TBL_Student', student.toMap());
    fetchStudents();
  }

  Future<List<Student>> getStudents() async {
    final db = await DBHelper.db;
    final result = await db.query('TBL_Student');
    return result.map((e) => Student.fromMap(e)).toList();
  }
  Future<void> deleteStudent(int enrollment) async {
    final db = await DBHelper.db;
    await db.delete('TBL_Student', where: 'enrollment = ?', whereArgs: [enrollment]);
    fetchStudents();
  }
  Future<void> updateStudent(Student student) async {
    final db = await DBHelper.db;
    await db.update('TBL_Student', student.toMap(), where: 'enrollment = ?', whereArgs: [student.enrollment]);
    fetchStudents();
  }

}
