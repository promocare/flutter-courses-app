import 'package:courses/pages/detail_page.dart';
import '../utils/category.dart';
import '../utils/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseRow extends StatefulWidget{
    
    Category _category;
    CourseRow(this._category);

    @override State createState() => CourseRowState();
}

class CourseRowState extends State<CourseRow>{

    Category get category => this.category;

      @override Widget build(BuildContext context){

      return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){

        return Container(
          margin: EdgeInsets.only(top:20.0),
          padding: EdgeInsets.all(6.0),
          width: constraints.maxWidth,
          height: ScreenUtil.getInstance().setHeight(280),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1.0,
                blurRadius: 9.0
              )
            ],
          ),
          child: InkWell(
              onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>DetailPage(widget._category))); } ,
              splashColor: Colors.white,
              child: Row(
                children: <Widget>[
                  Container(
                    width: constraints.maxWidth/2 ,
                    child: ClipRRect(
                      child: Hero( child:Image.asset(widget._category.assetName),tag:"catPic"+widget._category.id.toString() ),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),bottomLeft: Radius.circular(8.0)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10.0),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(widget._category.name,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil.getInstance().setSp(40)
                      ),textAlign: TextAlign.left,),
                      Padding(padding: EdgeInsets.only(bottom: 5.0),),
                      Text(widget._category.coursesNumber.toString()+" Courses",style: TextStyle(
                        color: Color.fromRGBO(177,177,177,1),
                        fontSize: ScreenUtil.getInstance().setSp(25)
                      ),textAlign: TextAlign.left,)
                    ]
                  )
                ]
              )
            )
        );
      },);
      
    }

}