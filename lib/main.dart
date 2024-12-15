import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {


  String result = '0.0';
var inputController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height/3,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                   decoration: InputDecoration(fillColor: Colors.grey.withOpacity(0.3),border: InputBorder.none,filled: true),
                    
                    controller: inputController,
                    keyboardType: TextInputType.none,
                
                  ),
                  // Text(input,style: TextStyle(fontSize: 35),),
                  SizedBox(height: 40,),
                  Text(result,style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
            decoration: BoxDecoration(
              // color: Colors.greenAccent,
              borderRadius:BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30))

            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              mybutton(context,size, Colors.orange, 'AC'),
              mybutton(context,size, Colors.blueAccent,'( )'),
              mybutton(context,size, Colors.brown,'%'),
              mybutton(context,size, Colors.purpleAccent,'÷'),
            ],
          ),
          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              mybutton(context,size, Colors.blueGrey,'7'),
              mybutton(context,size, Colors.blueGrey,'8'),
              mybutton(context,size, Colors.blueGrey,'9'),
              mybutton(context,size, Colors.lightBlue,'x'),
            ],
             ),
          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              mybutton(context,size, Colors.blueGrey,'4'),
              mybutton(context,size, Colors.blueGrey,'5'),
              mybutton(context,size, Colors.blueGrey,'6'),
              mybutton(context,size, Colors.lightGreen,'-'),
            ],
          ),
          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              mybutton(context,size, Colors.blueGrey,'1'),
              mybutton(context,size, Colors.blueGrey,'2'),
              mybutton(context,size, Colors.blueGrey,'3'),
              mybutton(context,size, const Color.fromARGB(255, 46, 19, 248),'+'),
            ],
          ),
          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              mybutton(context,size, Colors.blueGrey,'0'),
              mybutton(context,size, Colors.blueGrey,'.'),
              mybutton(context,size, Colors.red,'⌫'),
              mybutton(context,size, const Color.fromARGB(255, 3, 79, 13), '='),
            ],
          ),
           
        ],
      ),
    );
  }



  InkWell mybutton(BuildContext context, size,Color color,String value) {
    return InkWell(
      onTap: (){
        buttonPressed(value);
       
      },
      
      child: Container(
                width: size.width/4.5,
                height: size.height/9.5,
                child: Center(child: Text(value,style: TextStyle(fontSize: 40,color: Colors.white),)),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(50),
                ),
      
              ),
    );
  }

  void buttonPressed(String value) {
    print(value);
        setState(() {

      if (value == 'AC') {
        result = '0.0';
        inputController.text = '';
      } else if (value == '=') {
        result = calculateResult(inputController.text);
      } else if(value=='⌫'){
        if (inputController.text.isNotEmpty) {
        inputController.text = inputController.text.substring(0, inputController.text.length - 1);
      }

      }
      
      else {
        inputController.text += value;
      }
    });

  }

  String calculateResult(String userInput) {
    try {
      final expression = userInput.replaceAll('x', '*').replaceAll('÷', '/');
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      return eval.toString();
    } catch (e) {
      return 'error';
    }
  }
}
