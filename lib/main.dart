import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 建立appTitle物件
    var appTitle = const Text('');

    // 建立appBody物件
    var appBody = calculator();

    // 建立appBar物件
    var appBar = AppBar(
      title: appTitle,
    );

    // 建立app物件
    var app = MaterialApp(
      home: Scaffold(
        appBar: appBar,
        body: appBody,
        backgroundColor: Colors.black,
      ),
    );

    return app;
  }
}
class calculator extends StatefulWidget
{
  @override
  compute createState() => compute();

}

class compute extends State {
  String text = "";
  String _beforeText = "";
  String op = "";
  String optext = "";
  bool _isResult = false;

  void operation() {
    double _value2Double(String value) {
      if (text.startsWith('-')) {
        String s = value.substring(1);
        return double.parse(s) * -1;
      } else {
        return double.parse(value);
      }
    }

    switch (op) {
      case "0":
      case "1":
      case "2":
      case "3":
      case "4":
      case "5":
      case "6":
      case "7":
      case "8":
      case "9":
      case ".":
        if (_isResult) {
          text = op;
        }
        if (text.startsWith('.')) {
          text = text.substring(1);
        }
        if (text.startsWith('0')) {
          text = text.substring(1);
        }
        text += op;
        break;
      case "*":
      case "/":
      case "+":
      case "-":
        _isResult = false;
        _beforeText = text;
        text = '';
        optext = op;

        break;
      case "AC":
        text = '0';
        _beforeText = '0';
        _isResult = false;
        break;
      case "%":
        double d = _value2Double(text);
        _isResult = true;
        text = '${d / 100.0}';
        break;
      case "+/-":
        if (text.startsWith('-')) {
          text = text.substring(1);
        } else {
          text = '-$text';
        }
        break;
      case "=":
        var d = _value2Double(_beforeText);
        var d1 = _value2Double(text);
        var d2;
        var d3;
        String t1;
        formatNum(d2, int postion) {
          if ((d2
              .toString()
              .length - d2.toString().lastIndexOf(".") - 1) < postion) {
            //小數點後有幾位小數
            text = d2.toStringAsFixed(postion).substring(
                0, d2.toString().lastIndexOf(".") + postion + 1).toString();
          } else {
            text = d2.toString().substring(
                0, d2.toString().lastIndexOf(".") + postion + 1).toString();
          }
        }
        rint(d2) {
          d3 = d2;
          d2 = d2.toInt();
          if ((d3 - d2) == 0) {
            text = d2.toString();
          }
          else {
            text = d3.toString();
          }
        }
        switch (optext) {
          case '+':
            d2 = (d + d1);
            rint(d2);
            break;
          case '-':
            d2 = (d - d1);
            rint(d2);
            break;
          case '*':
            d2 = (d * d1);
            rint(d2);
            break;
          case '/':
            if (d == 0 || d1 == 0) {
              text = "Eeeor";
            }
            else
            {
              d2 = d / d1 ;
              formatNum(d2, 9);
            }

            _beforeText = '';
            _isResult = true;
            op = '';
            break;
        }


    }
  }
    @override
    Widget build(BuildContext context) {
      final btn0 = ElevatedButton(child: const Text(
        '0', style: TextStyle(fontSize: 20, color: Colors.white,),),
        style: ElevatedButton.styleFrom(
            primary: Colors.white24, // 按鈕背景色
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 75),
            shape: StadiumBorder(
                side: BorderSide(
                  //设置 界面效果
                  style: BorderStyle.solid,
                  color: Colors.black26,
                )
            )
        ),
        onPressed: () =>
            setState(() {
              op = "0";
              operation();
            }),);
      final btn1 = ElevatedButton(child: const Text(
        '1', style: TextStyle(fontSize: 20, color: Colors.white,),),
        style: ElevatedButton.styleFrom(
            primary: Colors.white24, // 按鈕背景色
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: CircleBorder(
                side: BorderSide(
                  //设置 界面效果
                  width: 280.0,
                  style: BorderStyle.none,
                )
            )

        ),
        onPressed: () =>
            setState(() {
              op = "1";
              operation();
            }),);
      final btn2 = ElevatedButton(child: const Text(
        '2', style: TextStyle(fontSize: 20, color: Colors.white,),),
        style: ElevatedButton.styleFrom(
            primary: Colors.white24, // 按鈕背景色
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: CircleBorder(
                side: BorderSide(
                  //设置 界面效果
                  width: 280.0,
                  style: BorderStyle.none,
                )
            )

        ),
        onPressed: () =>
            setState(() {
              op = "2";
              operation();
            }),);
      final btn3 = ElevatedButton(child: const Text(
        '3', style: TextStyle(fontSize: 20, color: Colors.white,),),
        style: ElevatedButton.styleFrom(
            primary: Colors.white24, // 按鈕背景色
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: CircleBorder(
                side: BorderSide(
                  //设置 界面效果
                  width: 280.0,
                  style: BorderStyle.none,
                )
            )

        ),
        onPressed: () =>
            setState(() {
              op = "3";
              operation();
            }),);
      final btn4 = ElevatedButton(child: const Text(
        '4', style: TextStyle(fontSize: 20, color: Colors.white,),),
        style: ElevatedButton.styleFrom(
            primary: Colors.white24, // 按鈕背景色
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: CircleBorder(
                side: BorderSide(
                  //设置 界面效果
                  width: 280.0,
                  style: BorderStyle.none,
                )
            )

        ),
        onPressed: () =>
            setState(() {
              op = "4";
              operation();
            }),);
      final btn5 = ElevatedButton(child: const Text(
        '5', style: TextStyle(fontSize: 20, color: Colors.white,),),
        style: ElevatedButton.styleFrom(
            primary: Colors.white24, // 按鈕背景色
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: CircleBorder(
                side: BorderSide(
                  //设置 界面效果
                  width: 280.0,
                  style: BorderStyle.none,
                )
            )

        ),
        onPressed: () =>
            setState(() {
              op = "5";
              operation();
            }),);
      final btn6 = ElevatedButton(child: const Text(
        '6', style: TextStyle(fontSize: 20, color: Colors.white,),),
        style: ElevatedButton.styleFrom(
            primary: Colors.white24, // 按鈕背景色
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: CircleBorder(
                side: BorderSide(
                  //设置 界面效果
                  width: 280.0,
                  style: BorderStyle.none,
                )
            )

        ),
        onPressed: () =>
            setState(() {
              op = "6";
              operation();
            }),);
      final btn7 = ElevatedButton(child: const Text(
        '7', style: TextStyle(fontSize: 20, color: Colors.white,),),
        style: ElevatedButton.styleFrom(
            primary: Colors.white24, // 按鈕背景色
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: CircleBorder(
                side: BorderSide(
                  //设置 界面效果
                  width: 280.0,
                  style: BorderStyle.none,
                )
            )

        ),
        onPressed: () =>
            setState(() {
              op = "7";
              operation();
            }),);
      final btn8 = ElevatedButton(child: const Text(
        '8', style: TextStyle(fontSize: 20, color: Colors.white,),),
        style: ElevatedButton.styleFrom(
            primary: Colors.white24, // 按鈕背景色
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: CircleBorder(
                side: BorderSide(
                  //设置 界面效果
                  width: 280.0,
                  style: BorderStyle.none,
                )
            )

        ),
        onPressed: () =>
            setState(() {
              op = "8";
              operation();
            }),);
      final btn9 = ElevatedButton(child: const Text(
        '9', style: TextStyle(fontSize: 20, color: Colors.white,),),
        style: ElevatedButton.styleFrom(
            primary: Colors.white24, // 按鈕背景色
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: CircleBorder(
                side: BorderSide(
                  //设置 界面效果
                  width: 280.0,
                  style: BorderStyle.none,
                )
            )

        ),
        onPressed: () =>
            setState(() {
              op = "9";
              operation();
            }),);
      final btnac = ElevatedButton(child: const Text(
        'AC', style: TextStyle(fontSize: 20, color: Colors.white,),),
        style: ElevatedButton.styleFrom(
            primary: Colors.white60, // 按鈕背景色
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: CircleBorder(
                side: BorderSide(
                  //设置 界面效果
                  width: 280.0,
                  style: BorderStyle.none,
                )
            )

        ),
        onPressed: () =>
            setState(() {
              op = "AC";
              operation();
            }),);
      final btnpd = ElevatedButton(child: const Text(
        '+/-', style: TextStyle(fontSize: 20, color: Colors.white,),),
        style: ElevatedButton.styleFrom(
            primary: Colors.white60, // 按鈕背景色
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: CircleBorder(
                side: BorderSide(
                  //设置 界面效果
                  width: 280.0,
                  style: BorderStyle.none,
                )
            )

        ),
        onPressed: () =>
            setState(() {
              op = "+/-";
              operation();
            }),);
      final btnpa = ElevatedButton(child: const Text(
        '%', style: TextStyle(fontSize: 20, color: Colors.white,),),
        style: ElevatedButton.styleFrom(
            primary: Colors.white60, // 按鈕背景色
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: CircleBorder(
                side: BorderSide(
                  //设置 界面效果
                  width: 280.0,
                  style: BorderStyle.none,
                )
            )

        ),
        onPressed: () =>
            setState(() {
              op = "%";
              operation();
            }),);
      final btndot = ElevatedButton(child: const Text(
        '.', style: TextStyle(fontSize: 20, color: Colors.white,),),
        style: ElevatedButton.styleFrom(
            primary: Colors.white24, // 按鈕背景色
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: CircleBorder(
                side: BorderSide(
                  //设置 界面效果
                  width: 280.0,
                  style: BorderStyle.none,
                )
            )

        ),
        onPressed: () =>
            setState(() {
              op = ".";
              operation();
            }),);
      final btnplus = ElevatedButton(child: const Text(
        '+', style: TextStyle(fontSize: 20, color: Colors.white,),),
        style: ElevatedButton.styleFrom(
            primary: Colors.amber, // 按鈕背景色
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: CircleBorder(
                side: BorderSide(
                  //设置 界面效果
                  width: 280.0,
                  style: BorderStyle.none,
                )
            )

        ),
        onPressed: () =>
            setState(() {
              op = "+";
              operation();
            }),);
      final btnminus = ElevatedButton(child: const Text(
        '-', style: TextStyle(fontSize: 20, color: Colors.white,),),
        style: ElevatedButton.styleFrom(
            primary: Colors.amber, // 按鈕背景色
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: CircleBorder(
                side: BorderSide(
                  //设置 界面效果
                  width: 280.0,
                  style: BorderStyle.none,
                )
            )

        ),
        onPressed: () =>
            setState(() {
              op = "-";
              operation();
            }),);
      final btndiv = ElevatedButton(child: const Text(
        '÷', style: TextStyle(fontSize: 20, color: Colors.white,),),
        style: ElevatedButton.styleFrom(
            primary: Colors.amber, // 按鈕背景色
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: CircleBorder(
                side: BorderSide(
                  //设置 界面效果
                  width: 280.0,
                  style: BorderStyle.none,
                )
            )

        ),
        onPressed: () =>
            setState(() {
              op = "/";
              operation();
            }),);
      final btnmul = ElevatedButton(child: const Text(
        'x', style: TextStyle(fontSize: 20, color: Colors.white,),),
        style: ElevatedButton.styleFrom(
            primary: Colors.amber, // 按鈕背景色
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: CircleBorder(
                side: BorderSide(
                  //设置 界面效果
                  width: 280.0,
                  style: BorderStyle.none,
                )
            )

        ),
        onPressed: () =>
            setState(() {
              op = "*";
              operation();
            }),);
      final btnequals = ElevatedButton(child: const Text(
        '=', style: TextStyle(fontSize: 20, color: Colors.white,),),
        style: ElevatedButton.styleFrom(
            primary: Colors.amber, // 按鈕背景色

            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: CircleBorder(
                side: BorderSide(
                  //设置 界面效果
                  width: 280.0,
                  style: BorderStyle.none,
                )
            )

        ),
        onPressed: () =>
            setState(() {
              op = "=";
              operation();
            }),);


      final wid = Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  text,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              children: <Widget>[
                Expanded(child: Container(child: btnac,
                  margin: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),),),
                Expanded(child: Container(child: btnpd,
                  margin: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),),),
                Expanded(child: Container(child: btnpa,
                  margin: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),),),
                Expanded(child: Container(child: btndiv,
                  margin: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),),),
              ],
              mainAxisAlignment: MainAxisAlignment.center,),
            Row(children: <Widget>[
              Expanded(child: Container(child: btn7,
                margin: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),),),
              Expanded(child: Container(child: btn8,
                margin: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),),),
              Expanded(child: Container(child: btn9,
                margin: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),),),
              Expanded(child: Container(child: btnmul,
                margin: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),),),
            ],
              mainAxisAlignment: MainAxisAlignment.center,),
            Row(children: <Widget>[
              Expanded(child: Container(child: btn4,
                margin: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),),),
              Expanded(child: Container(child: btn5,
                margin: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),),),
              Expanded(child: Container(child: btn6,
                margin: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),),),
              Expanded(child: Container(child: btnminus,
                margin: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),),),
            ],
              mainAxisAlignment: MainAxisAlignment.center,),
            Row(children: <Widget>[
              Expanded(child: Container(child: btn1,
                margin: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),),),
              Expanded(child: Container(child: btn2,
                margin: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),),),
              Expanded(child: Container(child: btn3,
                margin: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),),),
              Expanded(child: Container(child: btnplus,
                margin: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),),),
            ],
              mainAxisAlignment: MainAxisAlignment.center,),
            Row(children: <Widget>[
              Container(child: btn0,
                margin: const EdgeInsetsDirectional.fromSTEB(8, 5, 11, 5),),
              Container(child: btndot,
                margin: const EdgeInsetsDirectional.fromSTEB(8, 5, 12, 5),),
              Container(child: btnequals,
                margin: const EdgeInsetsDirectional.fromSTEB(12, 5, 0, 5),),
            ],
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      );

      return wid;
    }
  }

