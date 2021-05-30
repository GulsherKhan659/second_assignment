import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/widgets/textBox.dart';
import 'package:flutter_app1/widgets/buttonDesign.dart';
import 'package:flutter_app1/widgets/footerWidgets.dart';
import 'package:flutter_app1/utilities/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'homeScreen.dart';
import 'signUpScreen.dart';
class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool visible=true,isChecked=false;
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
 void runFunction(){
   if(email.value.text.isNotEmpty && password.value.text.isNotEmpty && isChecked){
     FocusScope.of(context).unfocus();
     Navigator.of(context).push(MaterialPageRoute(builder: (_)=>HomeScreen(email:email.value.text,name: "email",)));
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
              print(layoutsize.maxWidth);
              return  Container(

                //color: Colors.red,
                child : SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: layoutsize.maxHeight*0.043,horizontal: layoutsize.maxHeight*0.04),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          WavyAnimatedText('LogIn',textStyle: TextStyle(
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
                      // Text("LogIn",style: TextStyle(
                      //   letterSpacing: 1.5,
                      //   fontSize: 30.0,
                      //   fontWeight: FontWeight.bold,
                      // ),),
                      SizedBox(
                        height:layoutsize.maxHeight * 0.02,
                      ),
                      TextEditingBox(
                        heightRatio:layoutsize.maxHeight,
                        textController:email,
                        boxHintText: "Enter Email Address",
                        boxText: "Email",
                        boxIcon: Icons.email,
                        boxKeyboardType: TextInputType.emailAddress,
                      ),

                      SizedBox(
                        height:layoutsize.maxHeight * 0.02,
                      ),
                      TextPassEditingBox(
                        heightRatio: layoutsize.maxHeight,
                        textController: password,
                        isVisible: visible,
                        vissibleFun: _vissibleFun,
                      ),

                      SizedBox(
                        height:layoutsize.maxHeight * 0.02,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              checkColor: Colors.white70,
                              activeColor: Colors.black,
                              value:isChecked, onChanged:(value){
                            setState(() {
                              isChecked=value;
                            });
                          }),
                          Text("Remember Me",style: kTextStyle)
                        ],
                      ),
                  SizedBox(
                    height:layoutsize.maxHeight * 0.02,
                  ),
                      ButtonDesign(
                        width:layoutsize.maxWidth,
                        buttonText: "Login",
                        buttonFunction: runFunction,),
                    SizedBox(
                      height:layoutsize.maxHeight * 0.02,
                    ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text("Forget Password?",style: kTextStyle,),
                      ),
                      SizedBox(
                        height:layoutsize.maxHeight * 0.02,
                      ),
                      Column(
                        children: [

                          Text("--OR--",style: kTextStyle),
                          SizedBox(
                            height:layoutsize.maxHeight * 0.02,
                          ),
                          Text("SignIn with",style: kTextStyle),
                        ],
                      ),
                      SizedBox(
                        height:layoutsize.maxHeight * 0.02,
                      ),
                      FooterWidgetSocialIcon(
                        firstImage: AssetImage("assets/images/facebook.png"),
                        secondImage: AssetImage("assets/images/google.png"),
                        firstFunction:()=>print("Facebook SignUp") ,
                        secondFunction: ()=>print("Google SignUp") ,

                      ),
                      SizedBox(
                        height:layoutsize.maxHeight * 0.02,
                      ),
                      MaterialButton(
                        onPressed: (){
                          print("Click");
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpScreen())
                          ); },
                        child: RichText(text: TextSpan(
                            children: [
                              TextSpan(text: "Create an Account?"),
                              TextSpan(text: "SignUp",style: TextStyle(
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
