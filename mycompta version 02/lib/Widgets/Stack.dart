import 'package:flutter/material.dart';
import 'package:mycompta/constants/constants.dart';
import 'package:mycompta/ui/Common/Custom.dart';
import 'package:mycompta/ui/Common/widgets.dart';
import 'package:mycompta/ui/widgets/confirmation.dart';
import 'package:mycompta/ui/widgets/responsive_ui.dart';


Widget CustomStack(Function fonction,String mainText,String sText,Color color,Color colorC,double left,double right){
return Container(
        width: 640.0,
        margin: EdgeInsets.only(right:right, top: 30.0, left:left),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            color: colorC,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [


            Text(
              mainText,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            ),


            SizedBox(
              height:0.0,
            ),
            RawMaterialButton(
              fillColor: color,
              onPressed: fonction,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Text(
                sText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      );


}
 class ArgentWidget extends StatelessWidget {
 
      GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
      
      @override
      Widget build(BuildContext context) {
       var _height = MediaQuery.of(context).size.height;
     var _width = MediaQuery.of(context).size.width;
     var _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    var _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    var  _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
        return Scaffold(
          key: _scaffoldKey,
          body: ListView(
                      children:[ Container(
              height: 160.0,
              child: Stack(
                children: <Widget>[
                  clipShape(context,_height,_large,_medium,_width),
                  Positioned(
                    top: 20.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.5), width: 1.0),
                            color: Colors.white),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: color1,
                              ),
                              onPressed: () {
                                print("your menu action here");
                                _scaffoldKey.currentState.openDrawer();
                              },
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Search",
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.search,
                                color: color1,
                              ),
                              onPressed: () {
                                print("your menu action here");
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.notifications,
                                color: color1,
                              ),
                              onPressed: () {
                                print("your menu action here");
                              },
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100.0,
                    left: 300.0,
                    right: 0.0,
                    
                                child: FloatingActionButton(
                                  backgroundColor: color2,
                                child: Icon(
                                  
                                  Icons.add,
                                  color: Colors.white,
                                  
                                ),
                                onPressed: () {
                                  
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          
                          TextFormField(
        
                          
                          cursorColor: Colors.blue,
                          
                          decoration: InputDecoration(
                          
                            hintText: "Produit",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none),
                            ),
                            ),




                          TextFormField(
                          keyboardType: TextInputType.number,

        
                          cursorColor: color1,
                          decoration: InputDecoration(
                            
                            hintText: "Nombre des pieces",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none),
                            ),
                            ),
                            TextFormField(
                              
                          keyboardType: TextInputType.text,

        
                          cursorColor: color1,
                          decoration: InputDecoration(
                            
                            hintText: "Caracteristique",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none),
                            ),
                            ),
                          TextFormField(
        
                          keyboardType: TextInputType.number,
                          cursorColor: color1,
                          decoration: InputDecoration(
                            
                            hintText: "Prix",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none),
                            ),
                            ),
                            CustomButton("Save",Colors.blue)
                        ],
                      );
                    });
                                },
                              ),
                    
                  )
                ]
                )
                ),
            Padding(
              padding: const EdgeInsets.only(left:138.0,bottom: 10),
              child: Text('Phones',style: TextStyle(backgroundColor:Colors.blue[200]),),
            ),
            SizedBox(
              height:210,
           
            child:Padding(
              padding: const EdgeInsets.only(right: 20,left: 20),
              
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ArgentCustom(Colors.cyan,"iPhone 12","iphne12.png","250.000","128 GB",43),
                  
                  ArgentCustom(Colors.grey,"iPhone 11","iphone11.jpg","220.000","64 GB",143),
                  ArgentCustom(Colors.grey,"iPhone XR","iphoneXR.jpg","200.000","256 GB",123),
                  ArgentCustom(Colors.orange,"Samsung J2","samj2.jpg","20.000","16 GB",38),


  
                    
              ],
              ),
            )
            ),
            SizedBox(height:20),
            Padding(
              padding: const EdgeInsets.only(left:138.0,bottom: 10),
              child: Text('HeadPhones',style: TextStyle(backgroundColor:Colors.blue[200]),),
            ),
            SizedBox(
              height:210,
           
            child:Padding(
              padding: const EdgeInsets.only(right: 20,left: 20),
              
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ArgentCustom(Colors.cyan,"AirPods iPhone","airpods.jpg","50.000","White",51),
                  
                  ArgentCustom(Colors.grey,"Casque","ecoutcasc.jpg","1200","Black",30),
                  ArgentCustom(Colors.grey,"Ecouteur iPhone","ecoutipho.jpg","20.000","White",123),
                  ArgentCustom(Colors.orange,"Ecouteur Samsung","ecoutsam.jpg","1000","White",38),

    
              ],
              ),
            )
            ),
            ]
          ),
      
    );
  }
}
