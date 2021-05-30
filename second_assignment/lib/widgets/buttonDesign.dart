import 'package:flutter/material.dart';
import 'package:flutter_app1/screen/homeScreen.dart';


class ButtonDesign extends StatelessWidget {
  final width,buttonText,buttonFunction;
  ButtonDesign({this.width,this.buttonText,this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: width,
        decoration: BoxDecoration(
        color: Colors.white,
       // gradient: ,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(-0.2,2.5)
          )
        ],
        borderRadius: BorderRadius.circular(50)
        ),
        child: MaterialButton(
        highlightColor:Colors.transparent,

          height: 14,
        padding: EdgeInsets.symmetric(vertical:15,horizontal: 40),
        onPressed:buttonFunction,

    child:Text(buttonText,style: TextStyle(
      color: Colors.purpleAccent,
      fontSize: 25
    ),),

        )

        );
  }
}
