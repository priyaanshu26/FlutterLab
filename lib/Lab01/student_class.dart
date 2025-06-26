class Student{
  String name;
  int enroll;
  int sem;

  Student({required this.name, required  this.enroll, required  this.sem});

  void displayStudentDetails() {
    print("Name: $name");
    print("Enroll: $enroll");
    print("Sem: $sem");
  }
}

void main() {
  Student student = Student(name: "Vinit", enroll: 23010101224, sem: 5);
  student.displayStudentDetails();

}