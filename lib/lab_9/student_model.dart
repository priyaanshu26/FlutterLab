class Student {
  int enrollment;
  String name;
  int age;
  String branch;
  String gender;
  int sem;
  String university;
  String city;

  Student({
    required this.enrollment,
    required this.name,
    required this.age,
    required this.branch,
    required this.gender,
    required this.sem,
    required this.university,
    required this.city,
  });

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      enrollment: map['enrollment'],
      name: map['name'],
      age: map['age'],
      branch: map['Branch'],
      gender: map['Gender'],
      sem: map['Sem'],
      university: map['University'],
      city: map['City'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'enrollment': enrollment,
      'name': name,
      'age': age,
      'Branch': branch,
      'Gender': gender,
      'Sem': sem,
      'University': university,
      'City': city,
    };
  }
}
