class StudentS {
  int enrollment;
  String name;
  int age;
  String branch;
  String gender;
  int sem;
  String university;
  String city;

  StudentS({
    required this.enrollment,
    required this.name,
    required this.age,
    required this.branch,
    required this.gender,
    required this.sem,
    required this.university,
    required this.city,
  });

  factory StudentS.fromMap(Map<String, dynamic> map) {
    return StudentS(
      enrollment: map['enrollment'],
      name: map['name'],
      age: map['age'],
      branch: map['branch'],
      gender: map['gender'],
      sem: map['sem'],
      university: map['university'],
      city: map['city'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'enrollment': enrollment,
      'name': name,
      'age': age,
      'branch': branch,
      'gender': gender,
      'sem': sem,
      'university': university,
      'city': city,
    };
  }
}
