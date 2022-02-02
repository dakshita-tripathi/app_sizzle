import 'dart:io';

import 'package:flutter/material.dart';
import 'screen_three.dart';
class screen_two extends StatefulWidget {
  screen_two(@required this.name, @required this.age, @required this.image);
  String name;
  int age;
  File? image;
  @override
  _screen_twoState createState() => _screen_twoState();
}


String c = "";

class _screen_twoState extends State<screen_two> {

  @override

  /**void init(){
     name=widget.name;
    age=widget.age;
     image= widget.image;
  }**/

  String gender="";
  int height=0;
  int weight=0;
  Widget build(BuildContext context) {
    String name=widget.name; int age=widget.age; File? image=widget.image;
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter info to calculate your BMI"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text("Enter your gender"),
            ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child:TextField(
              //controller: myController3,
              onChanged: (value){
                gender=value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Your gender here(F/M)",
              ),
              keyboardType: TextInputType.text,
            ),),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                "Enter your height:",
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextField(
                //controller: myController4,
                onChanged: (value){
                  height=int.parse(value);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: " Your height here(in cm)",
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                "Enter your weight:",
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextField(
                //controller: myController5,
                onChanged: (value){
                  weight=int.parse(value);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: " Your weight here(in kg)",
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(onPressed: (){

               if(gender==null){
                Widget okButton = TextButton(
                  child: Text("OK"),
                  onPressed: () { },
                );
                AlertDialog alert =AlertDialog(content: Text('please enter your gender '),actions: [okButton ]);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },);
              }
              else if(height==0){
                Widget okButton = TextButton(
                  child: Text("OK"),
                  onPressed: () { },
                );
                AlertDialog alert =AlertDialog(content: Text('height cannot be 0'),actions: [okButton ]);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },);
              }
              else if(weight==0){
                Widget okButton = TextButton(
                  child: Text("OK"),
                  onPressed: () { },
                );
                AlertDialog alert =AlertDialog(content: Text(' weight cannot be 0'),actions: [okButton ]);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },);
              }
              else{
                Navigator.push(context, MaterialPageRoute(builder: (context)=>screen_three(name, age, image,gender, height, weight )),);}
            },
              child: Text("See your results"),),
          ],
        ),
      ),
    );
  }
}
