import 'package:calculator/CalController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


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



  var fnController = Get.put(calController());
  
var inputController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(() {
          return Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 252, 147, 113)
            ),
            child: Column(
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
                          maxLines: 3,
                             decoration: InputDecoration(fillColor: Color.fromARGB(255, 209, 205, 205).withOpacity(0.3),border: InputBorder.none,filled: true),
                              
                              controller: TextEditingController(text: fnController.inputController.value),
                              keyboardType: TextInputType.none,
                                                
                            ),
                       
                        // Text(input,style: TextStyle(fontSize: 35),),
                        SizedBox(height: 40,),
                        Text(fnController.result.value,style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 209, 205, 205),
                    borderRadius:BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30))
            
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    fnController. mybutton(context,size, Colors.orange, 'AC'),
                    fnController. mybutton(context,size, Colors.brown,'( )'),
                    fnController. mybutton(context,size, Colors.brown,'%'),
                    fnController. mybutton(context,size, Colors.brown,'÷'),
                  ],
                ),
                SizedBox(height: 10,),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    fnController. mybutton(context,size, Colors.blueGrey,'7'),
                   fnController.  mybutton(context,size, Colors.blueGrey,'8'),
                    fnController. mybutton(context,size, Colors.blueGrey,'9'),
                    fnController. mybutton(context,size, Colors.brown,'x'),
                  ],
                   ),
                SizedBox(height: 10,),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    fnController. mybutton(context,size, Colors.blueGrey,'4'),
                   fnController.  mybutton(context,size, Colors.blueGrey,'5'),
                    fnController. mybutton(context,size, Colors.blueGrey,'6'),
                    fnController. mybutton(context,size, Colors.brown,'-'),
                  ],
                ),
                SizedBox(height: 10,),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    fnController. mybutton(context,size, Colors.blueGrey,'1'),
                    fnController. mybutton(context,size, Colors.blueGrey,'2'),
                    fnController. mybutton(context,size, Colors.blueGrey,'3'),
                    fnController. mybutton(context,size, Colors.brown,'+'),
                  ],
                ),
                SizedBox(height: 10,),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    fnController. mybutton(context,size, Colors.blueGrey,'0'),
                    fnController. mybutton(context,size, Colors.blueGrey,'.'),
                    fnController. mybutton(context,size, Colors.red,'⌫'),
                    fnController. mybutton(context,size, const Color.fromARGB(255, 3, 79, 13), '='),
                  ],
                ),
                 
              ],
            ),
          );
        }
      ),
    );
  }
}
