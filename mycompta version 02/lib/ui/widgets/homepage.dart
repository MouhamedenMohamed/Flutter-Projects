import 'package:flutter/material.dart';
import 'package:mycompta/Widgets/Stack.dart';
import 'package:mycompta/ui/Common/widgets.dart';
import 'package:mycompta/ui/widgets/responsive_ui.dart';

Widget CustomButton(String name,Color color){
return RaisedButton(
 onPressed: () {
       },
  color: color,
  child: Text(name)
);



}

class SignInScren extends StatefulWidget {
  @override
  _SignInScrenState createState() => _SignInScrenState();
}

class _SignInScrenState extends State<SignInScren> {

  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  GlobalKey<FormState> _key = GlobalKey();



  @override
  Widget build(BuildContext context) {
     _height = MediaQuery.of(context).size.height;
     _width = MediaQuery.of(context).size.width;
     _pixelRatio = MediaQuery.of(context).devicePixelRatio;
     _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
     _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
     void Stock(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>ArgentWidget()));
}
      void Argent(){
       
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
             
              Container(
             
                 
                child: Align(alignment: Alignment.center,
                widthFactor: 0.95,
                heightFactor: 0.75,
                child:Wrap(
                  spacing: 20,
                children: [
                    SizedBox(height:30),
              //  buttonCustom(Argent,context,_height,_large,_medium,_width,"Argent"),
              //  buttonCustom(Stock,context,_height,_large,_medium,_width,"Stock"),
                SquareContainer(Argent,'Comptabilite',Icons.monetization_on),
                SquareContainer(Stock,'Stock',Icons.trending_up),
                InkWell(),
               
                
                ],
                
                ) ,
                ),),
             
              
            ],
          ),
        ),
      ),
    );
  }




}




// ignore: non_constant_identifier_names
Widget SquareContainer(Function suivant,String text,IconData icon){
return Container(
height:130,
width: 100,
decoration:  BoxDecoration(color: Colors.white, border: Border.all(
                                color: Colors.grey.withOpacity(0.5), width: 1.0),
borderRadius: BorderRadius.circular(12)
),
child:Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
 children:[
     IconButton(icon: Icon(icon,size: 40,color: Colors.orange,), onPressed: suivant),
   
     Text(text,style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),),
   
   ],),

 

);



}

