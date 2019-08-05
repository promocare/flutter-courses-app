import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/course.dart';

class DetailCourse extends StatefulWidget{

  Course _course;

  DetailCourse(this._course);

  @override State createState() => DetailCourseState();
}

class DetailCourseState extends State<DetailCourse>{
  @override Widget build(BuildContext context){

    return  Container(
        width: ScreenUtil.getInstance().setWidth(370),
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.only(right: 25),
        decoration: BoxDecoration(
          color: Color.fromRGBO(237,240,254,1),
          borderRadius: BorderRadius.circular(8.0)	
        ),
        child: Column(
          children: <Widget>[
            Image.asset(widget._course.assetName),
            Text(widget._course.name,style:TextStyle(fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.only(top:5),),
            Text("10 hour classes",style:TextStyle(color:Color.fromRGBO(142,148,182,1)))
          ],
        ),
      );

  }
}