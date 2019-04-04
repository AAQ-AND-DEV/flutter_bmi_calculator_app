import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      backgroundColor: Colors.pinkAccent,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            new Image.asset("images/bmilogo.png",
            height: 150.0,
            width: 150.0,),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                        controller: null,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          labelText: "Age",
                              hintText: "in years",
                          icon: new Icon(Icons.person_outline),

                        ),
                      ),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      new TextField(
                        controller: null,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          labelText: "Height",
                          hintText: "number of feet",
                          icon: Icon(Icons.graphic_eq),

                        ),
                      ),
                      new TextField(
                        controller: null,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          labelText: "Height",
                          hintText: "number of inches",
                          icon: Icon(Icons.graphic_eq),

                        ),
                      ),
                    ],
                  ),
                  new TextField(
                    controller: null,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      labelText: "Weight",
                      hintText: "Weight in lbs",
                      icon: Icon(Icons.linear_scale),

                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}