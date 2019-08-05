import 'course.dart';

class Category{

  int id;
  int coursesNumber;
  String name;
  String assetName;
  List<Course> popularCourses;
  List<Course> beginnerCourses;

  Category(this.id,this.name,this.assetName,this.coursesNumber,this.popularCourses,this.beginnerCourses);

}