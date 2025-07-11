import 'package:get/get.dart';
import 's_model.dart';
import 's_db_helper.dart';

class StudentControllerS extends GetxController {
  RxList<StudentS> studentList = <StudentS>[].obs;
  int limit = 10;
  int offset = 0;
  bool isLoading = false;

  @override
  void onInit() {
    fetchStudents();
    super.onInit();
  }

  void fetchStudents({bool isInitial = true}) async {
    if (isLoading) return;
    isLoading = true;
    if (isInitial) {
      offset = 0;
      studentList.clear();
    }
    final students = await DBHelperS.fetchStudents(limit: limit, offset: offset);
    studentList.addAll(students);
    offset += limit;
    isLoading = false;
  }

  void addStudent(StudentS student) async {
    await DBHelperS.insertStudent(student);
    fetchStudents();
  }

  void updateStudent(StudentS student) async {
    await DBHelperS.updateStudent(student);
    fetchStudents();
  }

  void deleteStudent(int enrollment) async {
    await DBHelperS.deleteStudent(enrollment);
    studentList.removeWhere((s) => s.enrollment == enrollment);
  }

  void search(String query) async {
    if (query.isEmpty) {
      fetchStudents();
    } else {
      final result = await DBHelperS.searchStudent(query);
      studentList.value = result;
    }
  }
}
