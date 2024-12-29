//A. define an abstract named "Role"
abstract class Role{
  //declaring a method "void displayRole()"
  void displayRole();
}

//B.creating a class named "Person"
class Person {
  //creating attribute for name, age and address.
  String name;
  int age;
  String address;
  //including Role abstract class
  Role role;
  // providing a constructor method for attribute
  Person({
    required this.name,
    required this.age,
    required this.address,
    required this.role,
  });
  //providing a getter method for attribute
  String get getName => name;
  int get getAge => age;
  String get getAddress  => address;
  //implementing the Role abstract method
  void displayRole(){
    role.displayRole();
  }
}


//C.creating a class named Student that extend Person
class Student extends Person{
  //creating attribute for studentID, grade and a list of store courseScores.
   String studentID;
   String grade;
   List<int>courseScores;
  Student({
    required super.name,
    required super.age,
    required super.address,
    required this.studentID,
    required this.grade,
    required this.courseScores,
   }):
    super( role: StudentRole());

  //implement a method for calculate average
  double calculateAverage(){
    int sum = courseScores.reduce((a, b) => a + b);
    return sum/courseScores.length;
  }
}
//overriding Role for student
class StudentRole implements Role{
  @override
  void displayRole() {
    print("Role: Student");
  }
}

//D.creating a class named Teacher that extend Person
class Teacher extends Person{
  //creating attribute for teacherID and a list of coursesTaught.
  String teacherID;
  List<String> coursesTaught;

  Teacher( {
    required super.name,
    required super.age,
    required super.address,
    required this.teacherID,
    required this.coursesTaught,
  }):
    super(role: TeacherRole());

  //implementing a method to display the courses taught by the teacher
  void displayCourses(){
    print("Courses Taught:");
    for (var course in coursesTaught){
      print("- $course");
    }
  }

}
//overriding Role for Teacher
class TeacherRole implements Role{
  @override
  void displayRole() {
    print("Role: Teacher");
  }
}
//creating interface named student management system



class Studentmanagementsystem{
  static void main(){
    var student = Student(
        name:"John Doe",
        age:20,
        address:"123 Main St",
        studentID:"null",
        grade:"null",
        courseScores:[90, 85, 82],
    );

    var teacher = Teacher(
        name:"Mrs. Smith",
        age:35,
        address:"456 Oak St.",
        teacherID:"null",
        coursesTaught:["Math", "English", "Bangla"],);

    //display Student info
    print("Student Information:");
    student.displayRole();
    print("Name: ${student.getName}");
    print("Age: ${student.getAge}");
    print("Address: ${student.getAddress}");
    print("Average Score: ${student.calculateAverage().toStringAsFixed(1)}\n\n");

    //display Teacher info
    print("Teacher Information:");
    teacher.displayRole();
    print("Name: ${teacher.getName}");
    print("Age: ${teacher.getAge}");
    print("Address: ${teacher.getAddress}");
    teacher.displayCourses();
  }
}
void main(){
  Studentmanagementsystem.main();
  }