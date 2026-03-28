class Student {
  String name;
  int attendance;

  Student(this.name, {this.attendance = 0});

  @override
  String toString() {
    return "$name - Attendance: $attendance";
  }
}
