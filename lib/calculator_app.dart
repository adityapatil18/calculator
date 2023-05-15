import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  var result = "0";
  onButtonClick(Value) {
    // if value is AC
    if (Value == 'AC') {
      result = "0";
    } else if (Value == "=") {
      if (result.isNotEmpty) {
        var userInput = result;
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        result = finalValue.toString();
        if (result.endsWith(".0")) {
          result = result.substring(0, result.length - 2);
        }
      }
    } else {
      
      result = result + Value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 380,
                          height: 100,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          alignment: Alignment.centerRight,
                          color: Colors.black87,
                          child: Text(
                            result,
                            style: TextStyle(fontSize: 50, color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          // buttons area
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Button(
                  text1: 'AC', buttonBGColor: Color.fromARGB(255, 70, 70, 70)),
              Button(
                  text1: '+-', buttonBGColor: Color.fromARGB(255, 70, 70, 70)),
              Button(
                  text1: '%', buttonBGColor: Color.fromARGB(255, 70, 70, 70)),
              Button(text1: '/', buttonBGColor: Colors.orange)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Button(text1: '7'),
              Button(text1: '8'),
              Button(text1: '9'),
              Button(text1: '*', buttonBGColor: Colors.orange)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Button(text1: '4'),
              Button(text1: '5'),
              Button(text1: '6'),
              Button(text1: '-', buttonBGColor: Colors.orange)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Button(text1: '1'),
              Button(text1: '2'),
              Button(text1: '3'),
              Button(text1: '+', buttonBGColor: Colors.orange)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 196.5,
                child: Button(
                  text1: '0',
                ),
              ),
              Button(text1: '.'),
              Button(text1: '=', buttonBGColor: Colors.orange)
            ],
          ),
        ],
      ),
    );
  }

  Widget Button({text1, buttonBGColor = Colors.grey}) {
    return Expanded(
      child: Container(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: Colors.black54)),
                  primary: buttonBGColor,
                  padding: EdgeInsets.all(22)),
              onPressed: () => onButtonClick(text1),
              child: Text(
                text1,
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ))),
    );
  }
}
