import 'package:flutter/material.dart';
import 'package:mycompta/constants/constants.dart';
import 'package:mycompta/ui/Common/widgets.dart';
import 'package:mycompta/ui/widgets/confirmation.dart';
import 'package:mycompta/ui/widgets/custom_shape.dart';
import 'package:mycompta/ui/widgets/customappbar.dart';
import 'package:mycompta/ui/widgets/responsive_ui.dart';
import 'package:mycompta/ui/widgets/textformfield.dart';



class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool checkBoxValue = false;
  double _height;
  double _width;  
  double _pixelRatio;
  bool _large;
  bool _medium;

  @override
  Widget build(BuildContext context) {

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    void funt(){
  Navigator.push(context,MaterialPageRoute(builder: (context)=>Confirmation()));
       
}
    return Material(
      
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.88,child: CustomAppBar()),
                clipShape(),
                form(),
                acceptTermsTextRow(),
                SizedBox(height: _height/35,),
                // button(),
                buttonCustom(funt,context,_height,_large,_medium,_width,"Sign Up")
                
               
                //signInTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large? _height/8 : (_medium? _height/7 : _height/6.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color1, color2],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large? _height/12 : (_medium? _height/11 : _height/10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color1, color2],
                ),
              ),
            ),
          ),
        ),
        Container(
          height: _height / 5.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 3.0,
                  color: Colors.black26,
                  offset: Offset(1.0, 10.0),
                  blurRadius: 20.0),
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: GestureDetector(
              onTap: (){
                print('photo');
              },

              child: Icon(Icons.add_a_photo, size: _large? 40: (_medium? 33: 31),color: color1,)),
        ),
      //  Positioned(
      //    top: _height/29,
      //    left: _width/2.75,
      //    child: Container(
      //      alignment: Alignment.center,
      //      height: _height/23,
      //      padding: EdgeInsets.all(5),
      //      decoration: BoxDecoration(
      //        shape: BoxShape.circle,
      //        color:  Colors.orange[100],
      //      ),
      //      child: GestureDetector(
      //          onTap: (){
      //            print('Adding photo');
      //          },
      //          child: Icon(Icons.add_a_photo, size: _large? 22: (_medium? 15: 13),)),
      //    ),
      //  ),
      ],
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left:_width/ 12.0,
          right: _width / 12.0,
          top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            firstNameTextFormField(),
            SizedBox(height: _height / 60.0),
            lastNameTextFormField(),
            SizedBox(height: _height/ 60.0),
            emailTextFormField(),
            SizedBox(height: _height / 60.0),
            phoneTextFormField(),
            SizedBox(height: _height / 60.0),
            passwordTextFormField(),
             SizedBox(height: _height / 60.0),
            repasswordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "First Name",
    );
  }

  Widget lastNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "Last Name",
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email,
      hint: "Email ID",
    );
  }

  Widget phoneTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.number,
      icon: Icons.phone,
      hint: "Mobile Number",
    );
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

  Widget acceptTermsTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: myFirstcolor,
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                });
              }),
          Text(
            "I accept all terms and conditions",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: _large? 12: (_medium? 11: 10)),
          ),
        ],
      ),
    );
  }

  // Widget button() {
//     return RaisedButton(
//       elevation: 0,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
//       onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>Confirmation()));
       
//       },
//       textColor: Colors.white,
//       padding: EdgeInsets.all(0.0),
//       child: Container(
//         alignment: Alignment.center,
//       height: _height / 15,
//         width:_large? _width/4 : (_medium? _width/3.75: _width/3.5),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(20.0)),
//           gradient: LinearGradient(
//             colors: <Color>[color1, color2],
//           ),
//         ),
//         padding: const EdgeInsets.all(12.0),
//         child: Text('SIGN UP', style: TextStyle(fontSize: _large? 14: (_medium? 12: 10)),),
//       ),
//     );
//   }

 

//   Widget socialIconsRow() {
//     return Container(
//       margin: EdgeInsets.only(top: _height / 80.0),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           CircleAvatar(
//             radius: 15,
            
//           ),
//           SizedBox(
//             width: 20,
//           ),
//           CircleAvatar(
//             radius: 15,
            
//           ),
//           SizedBox(
//             width: 20,
//           ),
//           CircleAvatar(
//             radius: 15,
            
//           ),
//         ],
//       ),
//     );
//   }

//   Widget signInTextRow() {
//     return Container(
//       margin: EdgeInsets.only(top: _height / 20.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             "Already have an account?",
//             style: TextStyle(fontWeight: FontWeight.w400),
//           ),
//           SizedBox(
//             width: 5,
//           ),
//           GestureDetector(
//             onTap: () {},
//             child: Text(
//               "Sign in",
//               style: TextStyle(
//                   fontWeight: FontWeight.w800, color: color1, fontSize: 19),
//             ),
//           )
//         ],
//       ),
//     );
//   }
 }
