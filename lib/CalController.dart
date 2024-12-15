import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class calController extends GetxController{
  RxString result ='0.0'.obs;
  final inputController = ''.obs; 

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

      if (value == 'AC') {
        result.value = '0.0';
        inputController.value = '';
      } else if (value == '=') {
        result.value = calculateResult(inputController.value);
      } else if(value=='⌫'){
        if (inputController.value.isNotEmpty) {
        inputController.value = inputController.value.substring(0, inputController.value.length - 1);
      }

      }
      
      else {
        inputController.value += value;
      }


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