import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:courses/widgets/detail_course.dart';

import '../utils/course.dart';
import '../utils/category.dart';

class DetailPage extends StatefulWidget{

  Category _category;

  DetailPage(this._category);

  @override State createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage>{
  @override Widget build(BuildContext context){

    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true)..init(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
        
        
        Stack(children: <Widget>[
          TopCurve(),
          Padding( //Back button
            child: FlatButton(
              child: Icon(Icons.arrow_back,color: Colors.white,),
              onPressed: ()=> Navigator.of(context).pop(),
            ),
            padding: EdgeInsets.only(top:ScreenUtil.getInstance().setHeight(180/4)),
          ),

          Padding(
            padding: EdgeInsets.only(top:ScreenUtil.getInstance().setHeight(180),left:20,right:20),
            child: Hero(child:Image.asset(widget._category.assetName.toString()), tag:"catPic"+widget._category.id.toString()),
          ),

          LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){ //text in layout build for /2 width
            return  Padding(
              padding: EdgeInsets.only(left:constraints.maxWidth/2,top:50.0,right:20.0),
              child:  Container(
                padding: EdgeInsets.only(left:10),
                width: constraints.maxWidth/2-20 ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget._category.name,style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(50),
                      fontWeight: FontWeight.bold
                    ),textAlign: TextAlign.justify,),
                    Text(widget._category.coursesNumber.toString()+" cources",textAlign: TextAlign.end,),
                  ],)
              )
            );
            
          },),          
          
        ],),

        Padding(padding: EdgeInsets.all(20),
          child: Text("Popular Courses",textAlign: TextAlign.left,style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(40),
            fontWeight: FontWeight.bold
            ),)
        ),

        LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
          return Container(
            height: ScreenUtil.getInstance().setHeight(430),
            width: constraints.maxWidth,
            padding: EdgeInsets.only(left:20.0),
            child:  ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  for(var course in widget._category.popularCourses) DetailCourse(course)
                ],
              )
          );
        }),

        Padding(padding: EdgeInsets.all(20),
          child: Text("Beginner Courses",textAlign: TextAlign.left,style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(40),
            fontWeight: FontWeight.bold
            ),)
        ),

         LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
          return Container(
            height: ScreenUtil.getInstance().setHeight(430),
            width: constraints.maxWidth,
            padding: EdgeInsets.only(left:20.0),
            child:  ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  for(var course in widget._category.beginnerCourses) DetailCourse(course)
                ],
              )
          );
        }),
       
        Padding(padding: EdgeInsets.only(top:20.0),)

        ])
      )
    );
  }
}

class TopCurve extends StatelessWidget{
  @override Widget build(BuildContext context){
    return ClipPath(
      child: Container(
                color:  Color.fromRGBO(92, 109, 250, 1),
                height: ScreenUtil.getInstance().setHeight(180),
              ),
      clipper: DetailClipper(),
    );
    
  }
}

class DetailClipper extends CustomClipper<Path>{
  @override Path getClip(Size size){
    Path path = new Path();
    path.lineTo(0.0, size.height);

    var firstControlPont = Offset(size.width/5,size.height);
    var firstEndPoint    = Offset(size.width/2-30,size.height/2+10);
    path.quadraticBezierTo(firstControlPont.dx,firstControlPont.dy,firstEndPoint.dx,firstEndPoint.dy);

    var secondControlPont = Offset(size.width-(size.width/3),10);
    var secondEndPoint    = Offset(size.width-(size.width/5),0.0);
    path.quadraticBezierTo(secondControlPont.dx,secondControlPont.dy,secondEndPoint.dx,secondEndPoint.dy);

    path.lineTo(0.0, 0.0);

    return path;
  }

  @override bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}