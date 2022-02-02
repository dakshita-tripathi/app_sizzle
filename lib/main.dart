import 'dart:io';
import 'screen_two.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home:Homepage(),
    );
  }
}
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}



class _HomepageState extends State<Homepage> {
  File? _image;
  String name="";
  int age=0;
  Future getImage() async {
    try {
      final image = await ImagePicker.pickImage(
          source: ImageSource.gallery, imageQuality: 50);
      if (image == null)
        return;
      final imageTemp = File(image.path);
      setState(() {
        _image = image;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }}
    @override
    Widget build(BuildContext context) {
      return Scaffold(appBar: AppBar(
        centerTitle: true,
        title: const Text('Your Personal BMI Calculator'),
      ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,20,10,0),
                  child: Text("Name:", textAlign: TextAlign.left,),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: TextField(
                    onChanged: (value){
                      name=value;
                      },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your name",
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Text("Age:", textAlign: TextAlign.left,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,10,20),
                  child: TextField(
                    onChanged: (value){
                      age= int.parse(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your age",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,10,20),
                  child: SizedBox(
                    child:DecoratedBox(
                      decoration:const BoxDecoration(
                        color: Colors.blue
                      ) ,
                      child: Row(
                      children: [
                        FloatingActionButton(
                          onPressed:() =>getImage(),
                          backgroundColor: Colors.green,
                          child:Icon(Icons.add_photo_alternate_outlined),),

                        Text(' Add your image'),
                      ],),),

                    ),
                ),
                ElevatedButton(onPressed: (){
                  //String myControlle1=widget.myController1.toString();
                  //String myControlle2=widget.myController2.toString();

                  if(name==null){
                    Widget okButton = TextButton(
                      child: Text("OK"),
                      onPressed: () { },
                    );
                    AlertDialog alert =AlertDialog(content: Text('please enter your name '),actions: [okButton ]);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },);
                  }
                  else if(age==0){
                    Widget okButton = TextButton(
                      child: Text("OK"),
                      onPressed: () { },
                    );
                    AlertDialog alert =AlertDialog(content: Text('age cannot be 0 '),actions: [okButton ]);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },);
                  }
                  else if(_image==null){
                    Widget okButton = TextButton(
                      child: Text("OK"),
                      onPressed: () { },
                    );
                    AlertDialog alert =AlertDialog(content: Text('please enter your image'),actions: [okButton ]);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },);
                  }
                  else{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>screen_two(name, age, _image)),);}
                },
                  child: Text("Calculate your BMI"),),
                ],
            ),
          ),
        ),
      );
    }
  }




