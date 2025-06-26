class Student{
  int? Rollno;
  String? Name;
  String? Branch;
  int? Sem;
  void studentDetails() {
      Rollno = 1;
      Name = "Darshan";
      Branch = "CSE";
      Sem = 5;
  }
}
void main() {
  Student s = new Student();
  s.studentDetails();
  print("Rollno: ${s.Rollno}");
  print("Name: ${s.Name}");
  print("Branch: ${s.Branch}");
  print("Sem: ${s.Sem}");
}

