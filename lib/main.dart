import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = ScrollController();
  bool disabled = false;
  GlobalKey _key = GlobalKey();
  bool showtext = false;
  bool showclose = false;
  bool toggle = false;

  @override
  void initState() {
    // TODO: implement initState
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (isTop) {
          setState(() {
            disabled = false;
          });
        } else {
          setState(() {
            disabled = true;
          });
        }
      }
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton:Visibility(
              visible: !toggle,
              child: Container(
                width: 150,
                child:  FloatingActionButton(
                  shape:
                      BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                  onPressed: () {
                    log("${_key.currentContext?.size?.height} ${MediaQuery.of(context).size.height}");
                    setState(() {
                      showtext = true;
                      showclose = true;
                      toggle=true;
                    });
                  },
                  tooltip: 'Increment',
                  child: Text("Open"),
                ),
              ),
            ),
      body: Visibility(
        visible:showtext,
        child: Container(
          decoration:BoxDecoration(
            border: Border.all(color:Colors.black,width:3)
          ),
          margin:EdgeInsets.all(30),
          child: Stack(
            children: [
              Positioned(
                  top:5,
              right:10,
                  child: RaisedButton(
                onPressed: () {
                  setState(() {
                    showtext = false;
                    toggle=false;
                  });
                },
                child: Text("Close"),
              )),
              Positioned(
                  top:5,
                  right:10,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        showtext = false;
                        toggle=false;
                      });
                    },
                    child: Text("Close"),
                  )),
              Positioned(
                  bottom:5,
                  left:110,
                  right:110,

                  child: Visibility(
                    visible:disabled,
                    child: RaisedButton(
                      color:Colors.blue,
                      textColor:Colors.white,
                      onPressed: () {
setState(() {
  disabled=false;
});
                      },
                      child: Text("Agree"),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 50.0,bottom:50),
                child: SingleChildScrollView(
                  controller: _controller,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "The Flutter website (the “Website”) is hosted by Google. "
                          "By using and / or visiting the Website, "
                          "By using and / or visiting the Website, "
                          "you consent to be bound by Google’s general"
                          "By using and / or visiting the Website, "
                          "you consent to be bound by Google’s general"
                          "By using and / or visiting the Website, "
                          "you consent to be bound by Google’s general"
                          "By using and / or visiting the Website, "
                          "you consent to be bound by Google’s general"
                          "By using and / or visiting the Website, "
                          "you consent to be bound by Google’s general"
                          "By using and / or visiting the Website, "
                          "you consent to be bound by Google’s general"
                          "By using and / or visiting the Website, "
                          "you consent to be bound by Google’s general"
                          "By using and / or visiting the Website, "
                          "you consent to be bound by Google’s general"
                          "By using and / or visiting the Website, "
                          "you consent to be bound by Google’s general"
                          "By using and / or visiting the Website, "
                          "you consent to be bound by Google’s general"
                          "By using and / or visiting the Website, "
                          "you consent to be bound by Google’s general"
                          "By using and / or visiting the Website, "
                          "you consent to be bound by Google’s general"
                          "By using and / or visiting the Website, "
                          "you consent to be bound by Google’s general"
                          "you consent to be bound by Google’s general ",

                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

