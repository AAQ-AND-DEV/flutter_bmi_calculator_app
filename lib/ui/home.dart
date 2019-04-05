import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _heightControllerFeet = new TextEditingController();
  final TextEditingController _heightControllerInches = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _ageController = new TextEditingController();
  double _bmi = 0.0;
  String _bmiMsg = "";

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
              new Image.asset(
                "images/bmilogo.png",
                height: 150.0,
                width: 150.0,
              ),
              Container(
                margin: const EdgeInsets.all(3.0),
                alignment: Alignment.center,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                        labelText: "Age",
                        hintText: "in years",
                        icon: new Icon(Icons.person_outline),
                      ),
                    ),
                    new TextField(
                      controller: _heightControllerFeet,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: "Height (ft.)",
                        hintText: "number of feet",
                        icon: Icon(Icons.graphic_eq),
                      ),
                    ),
                    new TextField(
                      controller: _heightControllerInches,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: "Height (inches)",
                        hintText: "number of inches",
                        icon: Icon(Icons.graphic_eq),
                      ),
                    ),
                    new TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: "Weight",
                        hintText: "Weight in lbs",
                        icon: Icon(Icons.linear_scale),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new RaisedButton(
                    child: new Text("calculate"),
                    onPressed: (){
                  setState(() {
                    _bmi = _calcBMI(_weightController.text,_heightControllerFeet.text, _heightControllerInches.text);
                    _bmiMsg = "your bmi is $_bmi";
                  });}),
              ),

              Padding(
                padding: const EdgeInsets.all(24.0),
                child: new Text( _weightController.text.isEmpty||(_heightControllerFeet.text.isEmpty && _heightControllerInches.text.isEmpty)? "Please enter weight and height" :"$_bmiMsg",
                  style: new TextStyle(
                    color: Colors.brown,
                    fontSize: 19.4,
                  ),
                ),
              ),

                  ],
              ),
              ),

            ],
          )),
    );
  }
  double _calcBMI(String weight, String heightFeet, String heightInches){
    double res = 0.0;
    int lbs = 0;
    int ht = 0;
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight)>0){
      lbs = int.parse(weight);
    } else {print("enter weight");}
    if (int.parse(heightFeet).toString().isNotEmpty && int.parse(heightFeet)>1){
      ht = int.parse(heightFeet)*12;
    }
    if (int.parse(heightInches).toString().isNotEmpty && int.parse(heightInches)>0){
      ht += int.parse(heightInches);
    }
    if (int.parse(heightInches).toString().isNotEmpty || (int.parse(heightFeet).toString().isNotEmpty) && int.parse(weight).toString().isNotEmpty){
      res = lbs/(ht*ht)*703;
    } else{
      print("enter both a weight and a height");
    }
    return res;

  }
}
