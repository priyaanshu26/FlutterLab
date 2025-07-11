import '../assets/import_export.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key, required Student student});

  @override
  State<AddStudent> createState() => _AddStudentState();
}
  TextEditingController nameController = TextEditingController();
  TextEditingController enrollmentController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController semController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController ageController = TextEditingController();

class _AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Student")),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: "Name"),
          ),
          TextField(
            controller: enrollmentController,
            decoration: InputDecoration(hintText: "Enrollment"),
          ),

          TextField(
            controller: branchController,
            decoration: InputDecoration(hintText: "Branch"),
          ),

          TextField(
            controller: semController,
            decoration: InputDecoration(hintText: "Sem"),
          ),
          TextField(
            controller: cityController,
            decoration: InputDecoration(hintText: "City"),
          ),
          TextField(
            controller: genderController,
            decoration: InputDecoration(hintText: "Gender"),
          ),
          TextField(
            controller: universityController,
              decoration: InputDecoration(hintText: "University"),
          ),
          TextField(
            controller: ageController,
            decoration: InputDecoration(hintText: "Age"),
          ),
          ElevatedButton(onPressed: (){
            Student s = Student(
              name: nameController.text,
              enrollment: int.parse(enrollmentController.text),
              branch: branchController.text,
              sem: int.parse(semController.text),
              city: cityController.text,
              gender: genderController.text,
              university: universityController.text,
              age: int.parse(ageController.text),
            );
            Get.find<StudentController>().insertStudent(s);
            Navigator.pop(context);
          }, child: Text("Submit"))
        ])
    );
  }
}
