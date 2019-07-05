import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  

  Widget buildButton(String buttonText){
    return new Expanded(
      child: new OutlineButton(
        child: Text(buttonText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        onPressed: ()=> buttonPressed(buttonText),
        padding: EdgeInsets.all(24.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                padding: new EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 12.0
                ),
                child: new Text(
                  output,
                  style: new TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold
                    ),
                )
            ),
            new Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(
                children: <Widget>[
                  buildButton("9"),
                  buildButton("8"),
                  buildButton("7"),
                  buildButton("/"),
                ]),
                Row(
                    children: <Widget>[
                      buildButton("6"),
                      buildButton("5"),
                      buildButton("4"),
                      buildButton("X"),
                    ]),
                Row(
                    children: <Widget>[
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("-"),
                    ]),
                Row(
                    children: <Widget>[
                      buildButton("."),
                      buildButton("0"),
                      buildButton("00"),
                      buildButton("+"),
                    ]),
                Row(
                    children: <Widget>[
                      buildButton("CLEAR"),
                      buildButton("="),
                    ]),
              ])
          ],
        ),
      )
    );
  }

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR"){
        _output = "0";
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
    } else if(buttonText == "+"|| buttonText == "-"|| buttonText == "/" || buttonText == "X"){
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";

    } else if (buttonText == "."){
      if (_output.contains(".")){
        print("already contains a decimal");
        return;
      }
      else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "="){
      num2 = double.parse(output);
      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }
      if(operand == "X"){
        _output = (num1 * num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }
}
