import '../assets/import_export.dart';

class StudentListPage extends StatelessWidget {
  final StudentController controller = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    controller.fetchStudents();

    return Scaffold(
      appBar: AppBar(title: Text("Student Records")),
      body: Obx(() => ListView.builder(
        itemCount: controller.students.length,
        itemBuilder: (_, index) {
          final s = controller.students[index];
          return ListTile(
            title: Text("${s.name} (${s.enrollment})"),
            subtitle: Text("${s.branch} | Sem: ${s.sem} | ${s.city}"),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.insertStudent(
            Student(
              enrollment: DateTime.now().millisecondsSinceEpoch,
              name: "New Student",
              age: 20,
              branch: "CSE",
              gender: "Male",
              sem: 5,
              university: "GTU",
              city: "Ahmedabad",
            ),
          );
        },
      ),
    );
  }
}
