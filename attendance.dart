import 'dart:io';
import 'dart:convert';
import 'student.dart';

void saveStudents(List<Student> students) {
  final file = File('students.json');
  final data = students.map((s) => {
    'name': s.name,
    'attendance': s.attendance
  }).toList();
  file.writeAsStringSync(jsonEncode(data));
}

List<Student> loadStudents() {
  final file = File('students.json');
  if (!file.existsSync()) return [];
  final data = jsonDecode(file.readAsStringSync()) as List;
  return data.map((s) => Student(s['name'], attendance: s['attendance'])).toList();
}

void addStudent(List<Student> students) {
  stdout.write("Enter student name: ");
  String? name = stdin.readLineSync();

  if (name != null && name.isNotEmpty) {
    students.add(Student(name));
    print("Student added successfully!");
  } else {
    print("Invalid name.");
  }
}

void viewStudents(List<Student> students) {
  if (students.isEmpty) {
    print("No students found.");
    return;
  }

  print("\n--- Student List ---");
  for (int i = 0; i < students.length; i++) {
    print("${i + 1}. ${students[i]}");
  }
}

void updateAttendance(List<Student> students) {
  viewStudents(students);
  stdout.write("Enter student number to update: ");
  String? input = stdin.readLineSync();
  int index = int.parse(input!) - 1;

  if (index >= 0 && index < students.length) {
    students[index].attendance++;
    print("Attendance updated for ${students[index].name}!");
  } else {
    print("Invalid student number.");
  }
} 

void deleteStudent(List<Student> students) {
  viewStudents(students);
  stdout.write("Enter student number to delete: ");
  String? input = stdin.readLineSync();
  int index = int.parse(input!) - 1;

  if (index >= 0 && index < students.length) {
    print("Removing ${students[index].name}...");
    students.removeAt(index);
    print("Student deleted successfully!");
  } else {
    print("Invalid student number.");
  }
}
