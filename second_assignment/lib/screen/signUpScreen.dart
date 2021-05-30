import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter_app1/widgets/textBox.dart';
import 'package:flutter_app1/widgets/buttonDesign.dart';
import 'package:flutter_app1/widgets/footerWidgets.dart';
import 'package:flutter_app1/utilities/constants.dart';
import 'homeScreen.dart';
import 'logInScreen.dart';
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool visible=true,isChecked=false;
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  TextEditingController name = TextEditingController();
  void runFunction(){
    if(email.value.text.isNotEmpty && password.value.text.isNotEmpty && name.value.text.isNotEmpty&& isChecked){
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>HomeScreen(email:email.value.text,name:name.value.text,)));
    }else{
      print("Please Fill All The Fileds");
    }
    setState(() {

    });
  }
  void _vissibleFun(){
    setState(() {
      visible = !visible;
    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                height: double.infinity,
                width: double.infinity,
               decoration: BoxDecoration(
                 gradient: LinearGradient(
                     begin: Alignment.bottomCenter,
                     end: Alignment.topCenter,
                     colors: [
                       Color(0xFFA24ADE),
                       Color(0xFFDE62A0),
                       Color(0xFFF26A73),
                     //  Color(0xFFFFFFFF),
                     ],
                   stops: [0,0.6,1]

                 )
               ),
                ),
            LayoutBuilder(builder: (context, layoutsize) {
              return  Container(

                //color: Colors.red,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: layoutsize.maxHeight*0.029,horizontal: layoutsize.maxHeight*0.04),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          WavyAnimatedText('SignUp',textStyle: TextStyle(
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                          )),
                          //  WavyAnimatedText('Look at the waves'),
                        ],
                        isRepeatingAnimation: true,
                        onTap: (){},
                      ),
                      SizedBox(
                        height:layoutsize.maxHeight * 0.01,
                      ),
                      TextEditingBox(
                        heightRatio: layoutsize.maxHeight,
                        textController: name,
                        boxHintText: "Enter Your Name",
                        boxText: "Name",
                        boxIcon: Icons.person,
                        boxKeyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height:layoutsize.maxHeight * 0.01,
                      ),
                      TextEditingBox(
                        heightRatio: layoutsize.maxHeight,
                        textController: email,
                        boxHintText: "Enter Email Address",
                        boxText: "Email",
                        boxIcon: Icons.email,
                        boxKeyboardType: TextInputType.emailAddress,
                      ),

                      SizedBox(
                        height:layoutsize.maxHeight * 0.01,
                      ),
                      TextPassEditingBox(
                        heightRatio: layoutsize.maxHeight,
                        textController: password,
                        isVisible: visible,
                        vissibleFun: _vissibleFun,
                      ),

                      SizedBox(
                        height:layoutsize.maxHeight * 0.01,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              checkColor: Colors.white70,
                              activeColor: Colors.black,
                              value:isChecked, onChanged:(value){
                            setState(() {
                              isChecked=value;
                            });
                          }),
                          Text("Terms & Conditions",style: kTextStyle)
                        ],
                      ),
                      SizedBox(
                        height:layoutsize.maxHeight * 0.01,
                      ),
                      ButtonDesign(width:layoutsize.maxWidth,buttonText: "SignUp",buttonFunction: runFunction,),
                      SizedBox(
                        height:layoutsize.maxHeight * 0.01,
                      ),
                      Column(
                        children: [

                          Text("--OR--",style: kTextStyle),
                          SizedBox(
                            height:layoutsize.maxHeight * 0.01,
                          ),
                          Text("SignUp with",style: kTextStyle),
                        ],
                      ),
                      SizedBox(
                        height:layoutsize.maxHeight * 0.01,
                      ),
                      FooterWidgetSocialIcon(
                        firstImage: AssetImage("assets/images/facebook.png"),
                        secondImage: AssetImage("assets/images/google.png"),
                        firstFunction:()=>print("Facebook SignUp") ,
                        secondFunction: ()=>print("Google SignUp") ,

                      ),
                      SizedBox(
                        height:layoutsize.maxHeight * 0.01,
                      ),
                         MaterialButton(

                        onPressed: (){
                          print("Click");
                          Navigator.push(
                          context,
                         MaterialPageRoute(builder: (context) => LogInScreen())
                       ); },child: RichText(

                            text: TextSpan(
                            children: [
                              TextSpan(text: "Already have account?"),
                              TextSpan(text: "SignIn",style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ))
                            ]
                        )),
                      ),
                    ],),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
