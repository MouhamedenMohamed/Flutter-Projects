import 'package:flutter/material.dart';
import 'package:mycompta/ui/Common/widgets.dart';
import 'package:mycompta/ui/widgets/NewPassword.dart';
import 'package:mycompta/ui/widgets/responsive_ui.dart';
import 'package:mycompta/ui/widgets/textformfield.dart';



Widget CustomButton(String name,Color color){
return RaisedButton(
 onPressed: () {
       },
  color: color,
  child: Text(name)
);



}

class RecoverYourPassword extends StatefulWidget {
  @override
  _RecoverYourPasswordState createState() => _RecoverYourPasswordState();
}

class _RecoverYourPasswordState extends State<RecoverYourPassword> {

  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();




  @override
  Widget build(BuildContext context) {
     _height = MediaQuery.of(context).size.height;
     _width = MediaQuery.of(context).size.width;
     _pixelRatio = MediaQuery.of(context).devicePixelRatio;
     _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
     _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
     void New_Password(){
           Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>NewPassword()
                      )
                      );
     }
    return Material(
      child: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
                 clipShape(context,_height,_large,_medium,_width),
                  SizedBox(height:50),
                  RecoverPassword(),
                  SizedBox(height: 40,
                 ),
                  buttonCustom(New_Password,context,_height,_large,_medium,_width,"Continue"),

                 
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
    );
  }



  
  
  }


  

  
  Widget RecoverPassword() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      obscureText: true,
      icon: Icons.phone,
      hint: "Mobile Number",
    );
  }


