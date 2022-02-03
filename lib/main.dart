import 'dart:io';
import 'screen_two.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:image_picker/image_picker.dart';
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
      home: Homepage(),
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
  String name = "";
  int age = 0;
  Future getImage() async {
    try {
      ImagePicker picker=ImagePicker();
      XFile? image = await picker.pickImage(
          source: ImageSource.gallery, imageQuality: 50);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        _image = File(image.path);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Your Personal BMI Calculator'),
      ),
      body: Center(
        child: Container(
          //decoration:BoxDecoration(
            //image:DecorationImage(
            //image: NetworkImage('https://cdn.wallpapersafari.com/49/45/0PBrI9.jpg'),
          //),),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.file(_image!,
                            width: 150, height: 150, fit: BoxFit.cover),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: FlutterLogo(size:150)
                        //Image(width: 150, height: 150, fit: BoxFit.cover,
                        //image: NetworkImage("data:image/jpeg;base64,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"),
                      ),
                //FlutterLogo(size: 150)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Text(
                    "Name:",
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: TextField(
                    onChanged: (value) {
                      name = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your name",
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Text(
                  "Age:",
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: TextField(
                    onChanged: (value) {
                      age = int.parse(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your age",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: SizedBox(
                    child: DecoratedBox(
                      decoration: const BoxDecoration(color: Colors.blue),
                      child: Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () => getImage(),
                            backgroundColor: Colors.green,
                            child: Icon(Icons.add_photo_alternate_outlined),
                          ),
                          Text(' Add your image'),
                        ],
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    //String myControlle1=widget.myController1.toString();
                    //String myControlle2=widget.myController2.toString();
                    if (name == null) {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      );
                      AlertDialog alert = AlertDialog(
                          content: Text('please enter your name '),
                          actions: [okButton]);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    } else if (age == 0) {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      );
                      AlertDialog alert = AlertDialog(
                          content: Text('age cannot be 0 '),
                          actions: [okButton]);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    } else if (_image == null) {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      );
                      AlertDialog alert = AlertDialog(
                          content: Text('please enter your image'),
                          actions: [okButton]);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                screen_two(name, age, _image)),
                      );
                    }
                  },
                  child: Text("Calculate your BMI"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
