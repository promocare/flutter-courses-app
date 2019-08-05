import 'utils/category.dart';
import 'utils/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/course_row.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget{
  @override State createState() => HomePageState();
}

class HomePageState extends State<HomePage>{

  @override Widget build(BuildContext context){

    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true)..init(context);

    return Scaffold(
      body: SingleChildScrollView(child: 
        Stack(
          //fit: StackFit.expand,
          children: <Widget>[

            ClipPath(
              child: Container(
                height: ScreenUtil.getInstance().setHeight(500),
                width: double.infinity,
                decoration: BoxDecoration(
                  color:  Color.fromRGBO(92, 109, 250, 1),
                ),
              ),
              clipper: MyClipper()
            ),
            TopLayer()
            
          ],
        )
      ),
    );
  

  }
}

class MyClipper extends CustomClipper<Path>{
  @override Path getClip(Size size){
    Path path = new Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = new Offset(size.width/4+10,size.height);
    var firstEndPoint = new Offset(size.width/2-20,size.height-(size.height/4)+20);
    path.quadraticBezierTo(firstControlPoint.dx,firstControlPoint.dy,firstEndPoint.dx,firstEndPoint.dy);

    var secondControlPoint = new Offset(size.width/2+40,size.height-(size.height/3)-10);
    var secondEndPoint = new Offset(size.width-40,size.height-(size.height/3)-30);
    path.quadraticBezierTo(secondControlPoint.dx,secondControlPoint.dy,secondEndPoint.dx,secondEndPoint.dy);

    var thirdControlPoint = new Offset(size.width-5,size.height-(size.height/3)-40);
    var thirdEndPoint = new Offset(size.width,size.height-(size.height/2)-10);
    path.quadraticBezierTo(thirdControlPoint.dx,thirdControlPoint.dy,thirdEndPoint.dx,thirdEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);
    return path;
  }

  @override shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TopLayer extends StatelessWidget{
  
  @override Widget build(BuildContext context){

      List<Category> categories = [
    Category(1,"Graphic &\nDesigning", "assets/design.png", 40, 
      [
        Course("UX for freelancers", "assets/ux.png"),
        Course("User Research","assets/user.png")
      ],
      [ 
        Course("Design Thinking","assets/thinking.png"),
        Course("E-Commerce Psychology","assets/psychology.png")
      ]
    ),
    Category(2,"Digital &\nMarketing", "assets/marketing.png", 25, 
      [
        Course("UX for freelancers", "assets/ux.png"),
        Course("User Research","assets/user.png")
      ],
      [
        Course("Design Thinking","assets/thinking.png"),
        Course("E-Commerce Psychology","assets/psychology.png")
      ]
    ),
    Category(3,"Business &\nManagement", "assets/business.png", 50, 
      [
        Course("UX for freelancers", "assets/ux.png"),
        Course("User Research","assets/user.png")
      ],
      [
        Course("Design Thinking","assets/thinking.png"),
        Course("E-Commerce Psychology","assets/psychology.png")
      ]
    ),
    Category(4,"Music &\nAudio", "assets/music.png", 20, 
      [
        Course("UX for freelancers", "assets/ux.png"),
        Course("User Research","assets/user.png")
      ],
      [
        Course("Design Thinking","assets/thinking.png"),
        Course("E-Commerce Psychology","assets/psychology.png")
      ]
    )
  ];
    
    return Padding(
      padding: EdgeInsets.only(left:25.0,right:25.0,top:30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
    
          Row(children: <Widget>[ //Photo & name
          
              Container( //Photo holder
                width:ScreenUtil.getInstance().setWidth(110),
                height: ScreenUtil.getInstance().setHeight(110),
                child: ClipRRect(child:Image.asset("assets/profile.jpg",fit: BoxFit.cover),borderRadius: BorderRadius.circular(8.0),),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1.0,
                      blurRadius: 9.0
                    )
                  ]
                ),
              ),
              Padding(padding:EdgeInsets.only(left:10)),
              Column( //Name & Level
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Jessica Jaif",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: ScreenUtil.getInstance().setSp(40))),
                  Text("Begginer Level",style:TextStyle(color: Color.fromRGBO(180, 190, 251, 1),fontWeight:FontWeight.bold,fontSize: ScreenUtil.getInstance().setSp(30)))
                ]
              )

            ]
          ), //Photo & name

          Padding(padding: EdgeInsets.only(top:20),),
          Text(
            "Hey, What would you \nlike to learn today?",
            style:TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(45),
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start
          ),

          Padding(padding: EdgeInsets.only(top:20),),
          LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
              return Container(
                height: ScreenUtil.getInstance().setHeight(90),
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1.0,
                      blurRadius: 9.0
                    )
                  ]
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search your skill",
                    hintStyle: TextStyle(color:Colors.black38),
                    suffixIcon: Icon(Icons.search,color:Colors.black38),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left:20,right:20,top:13)
                  ),
                ),
              );
            }
          ),

          for(var category in categories ) CourseRow(category),
        
          Padding(padding: EdgeInsets.only(bottom: 20.0),)
          
        ],
      )
    );

  }
}
