import 'package:flutter/material.dart';
import 'package:mycompta/constants/constants.dart';
import 'package:mycompta/ui/Common/widgets.dart';
import 'package:mycompta/ui/splashscreen.dart';
import 'package:mycompta/ui/widgets/custom_shape.dart';
import 'package:mycompta/ui/widgets/responsive_ui.dart';
import 'package:mycompta/ui/widgets/shared.dart';
import 'package:mycompta/ui/widgets/textformfield.dart';

import '../signin.dart';






Widget CustomButton(String name,Color color){
return RaisedButton(
 onPressed: () {
       },
  color: color,
  child: Text(name)
);



}

class Confirmation extends StatefulWidget {
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {

  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();



  @override
  Widget build(BuildContext context) {
     _height = MediaQuery.of(context).size.height;
     _width = MediaQuery.of(context).size.width;
     _pixelRatio = MediaQuery.of(context).devicePixelRatio;
     _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
     _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
      void funt(){
  Navigator.push(context,MaterialPageRoute(builder: (context)=>SplashScreen()));
       
}
    return Material(
     
      child :MaterialApp(
        routes: {
          '/firstpage':(context)=>SignInScren()
        },
        debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Container(
            height: _height,
            width: _width,
            padding: EdgeInsets.only(bottom: 5),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  clipShape(),
                  SizedBox(height:50),
                  ConfirmePassword(),
                  SizedBox(height:50),
                 buttonCustom(funt,context,_height,_large,_medium,_width,"Confirmation"),

                  ClipRRect(
                   
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                 
                     
                      child: Align(alignment: Alignment.center,
                    widthFactor: 0.95,
                    heightFactor: 0.75,
                    child:Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    ],) ,
                    ),),
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }







  Widget clipShape() {
    //double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height:_large? _height/4 : (_medium? _height/3.75 : _height/3.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color1, color2],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large? _height/4.5 : (_medium? _height/4.25 : _height/4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color1, color2],
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(top: _large? _height/30 : (_medium? _height/25 : _height/20)),
          
        ),
      ],
    );
  }
  }
  Widget ConfirmePassword() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      obscureText: true,
      icon: Icons.lock,
      hint: "Enter the code",
    );
  }