import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BmiState();
  }
}

class BmiState extends State<Bmi> {
  final TextEditingController _heightControllerFeet =
      new TextEditingController();
  final TextEditingController _heightControllerInches =
      new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _ageController = new TextEditingController();
  double _bmi = 0.0;
  String _bmiMsg = "";
  String _overweightMsg = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: new Container(
          alignment: Alignment.topCenter,
          child: new ListView(
            padding: const EdgeInsets.all(8.0),
            children: <Widget>[
              new Image.asset(
                "images/bmilogo.png",
                height: 80.0,
                width: 150.0,
              ),
              Container(
                margin: const EdgeInsets.all(3.0),
                alignment: Alignment.center,
                color: Colors.pinkAccent[100],
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
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
                        icon: Icon(Icons.insert_chart),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: new RaisedButton(
                            child: new Text("calculate"),
                            color: Colors.pink[800],
                            textColor: Colors.white,
                            onPressed: () {
                              setState(() {
                                _bmi = _calcBMI(
                                    _weightController.text,
                                    _heightControllerFeet.text,
                                    _heightControllerInches.text);
                                _bmiMsg =
                                    "your bmi is ${_bmi.toStringAsFixed(2)}";
                                _givePrognosis(_bmi);
                              });
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: new Text(
                        _weightController.text.isEmpty ||
                                (_heightControllerFeet.text.isEmpty &&
                                    _heightControllerInches.text.isEmpty)
                            ? "Please enter weight and height"
                            : "$_bmiMsg",
                        style: new TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.w700,
                          fontSize: 19.4,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: new Text(
                        "Prognosis: $_overweightMsg",
                        style: new TextStyle(
                          color: Colors.red[900],
                          fontWeight: FontWeight.w700,
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

  double _calcBMI(String weight, String heightFeet, String heightInches) {
    double res = 0.0;
    int lbs = 0;
    int heightInInches = 0;
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      lbs = int.parse(weight);
    } else {
      print("enter weight");
    }
    if (int.parse(heightFeet).toString().isNotEmpty &&
        int.parse(heightFeet) > 1) {
      heightInInches = int.parse(heightFeet) * 12;
    }
    if (int.parse(heightInches).toString().isNotEmpty &&
        int.parse(heightInches) > 0) {
      heightInInches += int.parse(heightInches);
    }
    if (int.parse(heightInches).toString().isNotEmpty ||
        (int.parse(heightFeet).toString().isNotEmpty) &&
            int.parse(weight).toString().isNotEmpty) {
      res = lbs / (heightInInches * heightInInches) * 703;
    } else {
      print("enter both a weight and a height");
    }
    return res;
  }

  void _givePrognosis(double bmi) {
    if (bmi < 18.5) {
      _overweightMsg = "underweight";
      print(_overweightMsg);
    } else if (bmi >= 18.5 && bmi < 25) {
      _overweightMsg = "normal";
      print(_overweightMsg);
    } else if (bmi >= 25.0 && bmi < 30) {
      _overweightMsg = "overweight";
      print(_overweightMsg);
    } else {
      _overweightMsg = "obese";
      print(_overweightMsg);
    }
  }
}
