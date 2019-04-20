import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{
  var num1 = '0', num2 = '0', operator='', flag=0, ansStr='0';
  var num = [], numIndex = 0;

  _varClear(){
    num1 = '0'; num2 = '0'; operator = ''; flag = 0;
  }
  _display(){
    setState(() {
      if (flag == 1) {
        switch (operator) {
          case '*':
            ansStr = (int.parse(num1) * int.parse(num2)).toString();
            _varClear();
            break;
          case '/':
            ansStr = (int.parse(num1) / int.parse(num2)).toString();
            _varClear();
          break;
          case '-':
            ansStr = (int.parse(num1) - int.parse(num2)).toString();
            _varClear();
            break;
          case '+':
            ansStr = (int.parse(num1) + int.parse(num2)).toString();
            _varClear();
            break;
        }
      }
    });
  }
  _div(){
    setState(() {
      operator='/';
      flag=1;
      num2=ansStr;
      num1='';
    });
  }
  _add(){
    setState(() {
      operator='+';
      flag=1;
      num2=ansStr;
      num1='';
    });
  }
  _sub(){
    setState(() {
      operator='-';
      flag=1;
      num2=ansStr;
      num1='';
    });
  }
  _mul(){
    setState(() {
      operator='*';
      flag=1;
      num2=ansStr;
      num1='';
    });
  }

  _clear(){
    setState(() {
       _varClear();  ansStr='0';
    }
    );
  }
  _zero(){
    setState(() {
      num1 += "0";
      ansStr = int.parse(num1).toString();
      print("0 touched!");
    });
  }
  _one(){
    setState(() {
      num1 += "1";
      ansStr = int.parse(num1).toString();
      print("1 touched!");
    });
  }

  _two(){
    setState(() {
      num1 += "2";
      ansStr = int.parse(num1).toString();
      print("2 touched!");
    });
  }

  _three(){
    setState(() {
      num1 += "3";
      ansStr = int.parse(num1).toString();
      print("3 touched!");
    });
  }
  _four(){
    setState(() {
      num1 += "4";
      ansStr = int.parse(num1).toString();
      print("4 touched!");
    });
  }
  _five(){
    setState(() {
      num1 += "5";
      ansStr = int.parse(num1).toString();
      print("five touched!");
    });
  }
  _six(){
    setState(() {
      num1 += "6";
      ansStr = int.parse(num1).toString();
      print("six touched!");
    });
  }
  _seven(){
    setState(() {
      num1 += "7";
      ansStr = int.parse(num1).toString();
      print("7 touched!");
    });
  }
  _eight(){
    setState(() {
      num1 += "8";
      ansStr = int.parse(num1).toString();
      print("8 touched!");
    });
  }
  _nine(){
    setState(() {
      num1 += "9";
      ansStr = int.parse(num1).toString();
      print("9 touched!");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Calculator"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(
                  height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 100.0,
                ),
                alignment: Alignment.bottomRight,
                color: Colors.black45,
                child: Text(
                  "$ansStr",
                  style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white70
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(onPressed: _nine, inputString: '9'),
                  Button(onPressed: _eight, inputString: '8'),
                  Button(onPressed: _seven, inputString: '7'),
                  Button(onPressed: _add, inputString: '+')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(onPressed: _six, inputString: '6'),
                  Button(onPressed: _five, inputString: '5'),
                  Button(onPressed: _four, inputString: '4'),
                  Button(onPressed: _sub, inputString: '-')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(onPressed: _three, inputString: '3'),
                  Button(onPressed: _two, inputString: '2'),
                  Button(onPressed: _one, inputString: '1'),
                  Button(onPressed: _mul, inputString: '*')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(onPressed: _clear, inputString: 'C'),
                  Button(onPressed: _zero, inputString: '0'),
                  Button(onPressed: _display, inputString: '='),
                  Button(onPressed: _div, inputString: '/')
                ],
              )
            ],
          ),
        )
    );
  }


}

class Button extends StatelessWidget{
  Button({this.onPressed, this.inputString});

  final VoidCallback onPressed;
  final String inputString;

  Widget build(BuildContext context){
    return MaterialButton(
        height: 100.0,
        child: Text(inputString,
            style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)
        ),
        textColor: Colors.black,
        color: Colors.grey[100],
        onPressed: onPressed
    );
  }


}

