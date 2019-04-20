import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{
  var numTmp='', index = 0, flag=0, ansStr='0';
  var num = List(), operator = List();

  _varClear(){
    numTmp=''; index=0; flag = 0;
    num.clear(); operator.clear();
  }

  dynamic _calculate(var operand1, var operand2, String oper){
    if(oper == '*')
        return operand1 * operand2;
    else if (oper == '/')
        return operand1 / operand2;
    else if (oper == '+')
      return operand1 + operand2;
    else if (oper == '-')
      return operand1 - operand2;

  }

  _display(){
    setState(() {
      num.add(numTmp);
      var ans = int.parse(num[0]);
      if (flag == 1) {
        for(int i=0; i<index; i++){
          ans = _calculate(ans, int.parse(num[i+1]), operator[i]);
        }
        ansStr="$ans";
        _varClear();
      }
    });
  }
  _mul(){
    setState(() {
      if (numTmp == ''){
        if (index != 0)
          operator.replaceRange(index-1,index,['*']);
          print(operator);
      }else{
        operator.add('*');
        num.add(numTmp);
        numTmp='';
        index++;
        flag=1;
      }
    });
  }
  _div() {
    setState(() {
      if (numTmp == ''){
        if (index != 0)
          operator.replaceRange(index-1,index,['/']);
        print(operator);
      }else {
        operator.add('/');
        num.add(numTmp);
        numTmp = '';
        index++;
        flag = 1;
      }
    });
  }
  _add(){
    setState(() {
      if (numTmp == ''){
        if (index != 0)
          operator.replaceRange(index-1,index,['+']);
        print(operator);
      } else {
        operator.add('+');
        num.add(numTmp);
        numTmp = '';
        index++;
        flag = 1;
      }
    });
  }
  _sub(){
    setState(() {
      if (numTmp == ''){
        if (index != 0)
          operator.replaceRange(index-1,index,['-']);
        print(operator);
      } else {
        operator.add('-');
        num.add(numTmp);
        numTmp = '';
        index++;
        flag = 1;
      }
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
      numTmp += "0";
      ansStr = int.parse(numTmp).toString();
      print("0 touched!");
    });
  }
  _one(){
    setState(() {
      numTmp += "1";
      print("$index, $num");
      ansStr = int.parse(numTmp).toString();
      print("1 touched!");
    });
  }

  _two(){
    setState(() {
      numTmp += "2";
      ansStr = int.parse(numTmp).toString();
      print("2 touched!");
    });
  }

  _three(){
    setState(() {
      numTmp += "3";
      ansStr = int.parse(numTmp).toString();
      print("3 touched!");
    });
  }
  _four(){
    setState(() {
      numTmp += "4";
      ansStr = int.parse(numTmp).toString();
      print("4 touched!");
    });
  }
  _five(){
    setState(() {
      numTmp += "5";
      ansStr = int.parse(numTmp).toString();
      print("five touched!");
    });
  }
  _six(){
    setState(() {
      numTmp += "6";
      ansStr = int.parse(numTmp).toString();
      print("six touched!");
    });
  }
  _seven(){
    setState(() {
      numTmp += "7";
      ansStr = int.parse(numTmp).toString();
      print("7 touched!");
    });
  }
  _eight(){
    setState(() {
      numTmp += "8";
      ansStr = int.parse(numTmp).toString();
      print("8 touched!");
    });
  }
  _nine(){
    setState(() {
      numTmp += "9";
      ansStr = int.parse(numTmp).toString();
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

