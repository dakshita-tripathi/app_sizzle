import 'dart:io';
import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'main.dart';
class screen_three extends StatefulWidget {
  screen_three(@required this.name,@required this.age, @required this.image, @required this.gender, @required this.height, @required this.weight) ;
   String name;
   int age;
   File? image;
   String gender;
   int height;
   int weight;

  @override
  _screen_threeState createState() => _screen_threeState();
}

class _screen_threeState extends State<screen_three> {

  @override
  Widget build(BuildContext context) {
     String s=""; String name=widget.name; int age=widget.age; File? image=widget.image; String gender=widget.gender; int height=widget.height; int weight=widget.weight;
    /**void init(){
      name=widget.name;
      age=widget.age;
      image= widget.image;
      gender= widget.gender;
      height=widget.height;
      weight=widget.weight;}**/
    double bmi= (weight/height)*(1/(height*100*100));
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Results'),
      ),
      body:Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20,20,20,0),
              child: Text('Hi $name. Hope you are doing good. Here are your results.'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text("Your age: $age")
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Text("Your gender: $gender")
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Text("Your height: $height")
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Text("Your weight: $weight")
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,20,20,0),
              child: Text('Your BMI(Body Mass Index) is: $bmi'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child:  Text((() {
                  if( bmi<18.5){
                    s="You are UNDERWEIGHT. Eat more and exercise well";
                    return("You are UNDERWEIGHT. Eat more and exercise well");
                    }
                  else if((bmi>=18.5 && bmi<=24.9)){
                    s="You are HEALTHY,Enjoy";
                    return("You are HEALTHY,Enjoy");
                  }
                  else if( (bmi>=25 && bmi<=29.9)){
                    s="You are OVERWEIGHT,Be cautious";
                    return("You are OVERWEIGHT,Be cautious");
                  }
                  else {
                    s="You are OBESE,Please take your health seriously";
                    return("You are OBESE,Please take your health seriously");
                  }
                })()),
            ),
      RaisedButton(
        child:  Text('Share'),
        onPressed: ()
        {
          final RenderBox box = context.findRenderObject() as RenderBox;
          Share.share(s,
              sharePositionOrigin:
              box.localToGlobal(Offset.zero) &
              box.size);
        },
      ),

      ],
        ),
      ),
    );}
  }

