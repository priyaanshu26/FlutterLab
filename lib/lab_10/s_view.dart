import '../assets/import_export.dart';

class StudentPage extends StatelessWidget {
  final controller = Get.put(StudentControllerS());

  final enrollmentCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final ageCtrl = TextEditingController();
  final branchCtrl = TextEditingController();
  final genderCtrl = TextEditingController();
  final semCtrl = TextEditingController();
  final universityCtrl = TextEditingController();
  final cityCtrl = TextEditingController();

  void showForm({StudentS? student}) {
    if (student != null) {
      enrollmentCtrl.text = student.enrollment.toString();
      nameCtrl.text = student.name;
      ageCtrl.text = student.age.toString();
      branchCtrl.text = student.branch;
      genderCtrl.text = student.gender;
      semCtrl.text = student.sem.toString();
      universityCtrl.text = student.university;
      cityCtrl.text = student.city;
    } else {
      enrollmentCtrl.clear();
      nameCtrl.clear();
      ageCtrl.clear();
      branchCtrl.clear();
      genderCtrl.clear();
      semCtrl.clear();
      universityCtrl.clear();
      cityCtrl.clear();
    }

    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ..._buildTextFields(),
              ElevatedButton(
                onPressed: () {
                  final student = StudentS(
                    enrollment: int.parse(enrollmentCtrl.text),
                    name: nameCtrl.text,
                    age: int.parse(ageCtrl.text),
                    branch: branchCtrl.text,
                    gender: genderCtrl.text,
                    sem: int.parse(semCtrl.text),
                    university: universityCtrl.text,
                    city: cityCtrl.text,
                  );
                  if (controller.studentList.any((s) => s.enrollment == student.enrollment)) {
                    controller.updateStudent(student);
                  } else {
                    controller.addStudent(student);
                  }
                  Get.back();
                },
                child: Text(student != null ? 'Update' : 'Add'),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTextFields() {
    return [
      TextField(controller: enrollmentCtrl, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: 'Enrollment')),
      TextField(controller: nameCtrl, decoration: InputDecoration(labelText: 'Name')),
      TextField(controller: ageCtrl, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: 'Age')),
      TextField(controller: branchCtrl, decoration: InputDecoration(labelText: 'Branch')),
      TextField(controller: genderCtrl, decoration: InputDecoration(labelText: 'Gender')),
      TextField(controller: semCtrl, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: 'Semester')),
      TextField(controller: universityCtrl, decoration: InputDecoration(labelText: 'University')),
      TextField(controller: cityCtrl, decoration: InputDecoration(labelText: 'City')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent) {
        controller.fetchStudents(isInitial: false);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Student Management"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Get.defaultDialog(
                title: "Search",
                content: TextField(
                  onChanged: controller.search,
                  decoration: InputDecoration(hintText: "Search name/branch/city"),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showForm(),
        child: Icon(Icons.add),
      ),
      body: Obx(() => ListView.builder(
        controller: scrollController,
        itemCount: controller.studentList.length,
        itemBuilder: (_, i) {
          final student = controller.studentList[i];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              title: Text("${student.name} (${student.enrollment})"),
              subtitle: Text(
                "Branch: ${student.branch}, Sem: ${student.sem}, City: ${student.city}",
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => showForm(student: student),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => controller.deleteStudent(student.enrollment),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
