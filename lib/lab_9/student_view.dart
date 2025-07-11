import 'package:lab/lab_9/student_add.dart';
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
            subtitle: Text("Branch ${s.branch} | Sem: ${s.sem} | City ${s.city}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AddStudent(student: s)),
                    );
                    },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    controller.deleteStudent(s.enrollment);
                    },
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => StudentListPage()),
              );
              controller.fetchStudents();

          }
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
        },
      ),
    );
  }
}
