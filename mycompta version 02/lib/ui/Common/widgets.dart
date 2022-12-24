import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycompta/ui/widgets/custom_shape.dart';
import '../../constants/constants.dart';

Widget buttonCustom(Function _function,BuildContext context,double _height, bool _large,bool _medium,double _width,String name) {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: _function,
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
      height: _height / 15,
        width:_large? _width/4 : (_medium? _width/3.75: _width/3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[color1,buttonColor],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(name, style: TextStyle(fontSize: _large? 14: (_medium? 12: 10)),),
      ),
    );
  
    
} 
Widget clipShape(BuildContext context,double _height, bool _large,bool _medium,double _width) {
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