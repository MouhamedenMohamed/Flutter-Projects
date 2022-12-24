import 'package:flutter/material.dart';
import 'package:mycompta/ui/Common/widgets.dart';
import 'package:mycompta/ui/widgets/confirmation.dart';
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

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {

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
     void Confirmer(){
Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>Confirmation()
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
                 passwordTextFormField(),
             SizedBox(height: _height / 60.0),
            repasswordTextFormField(),
                  SizedBox(height:50),
                  buttonCustom(Confirmer,context,_height,_large,_medium,_width,"Confirme"),
                  
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

  Widget passwordTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      obscureText: true,
      icon: Icons.lock,
      hint: "Password",
    );
  }
   Widget repasswordTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      obscureText: true,
      icon: Icons.lock,
      hint: "Repeate Password",
    );
  }