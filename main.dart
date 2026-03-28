import 'dart:io';
import 'student.dart';
import 'attendance.dart';

void main() {
  List<Student> students = [];

  while (true) {
    print("\n=== Student Attendance System ===");
    print("1. Add Student");
    print("2. View Students");
    print("3. Update Attendance");
    print("4. Delete Student");
    print("5. Exit");
    stdout.write("Choose an option: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addStudent(students);
        break;
      case '2':
        viewStudents(students);
        break;
      case '3':
        updateAttendance(students);
        break;
      case '4':
        deleteStudent(students);
        break;
      case '5':
        print("Exiting program...");
        return;
      default:
        print("Invalid choice. Try again.");
    }
  }
}
