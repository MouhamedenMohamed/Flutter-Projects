import 'package:flutter/material.dart';

Widget ArgentCustom(Color color,String nom,String photo,String prix,String caracter,int nombre){

return Padding(
  padding: const EdgeInsets.only(right:8.0),
  child:   Container(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text("Prix: $prix MRU",style: TextStyle(fontSize: 10),),
               ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Nombre: $nombre",style: TextStyle(fontSize: 10,backgroundColor: Colors.orange[200]),),
                )
             ],
        ),
       Image.asset('Assets/$photo',
              height: 150.0,width:150,fit: BoxFit.scaleDown,)
      ,
      Row(
children: [
   Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(nom,style: TextStyle(fontSize: 10),),
               ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(caracter,style: TextStyle(fontSize: 10,backgroundColor: Colors.orange[200]),),
                )
],
      )
      ],
    ),
  
    decoration: BoxDecoration(
  
      gradient: LinearGradient(colors: [
  
        color,
  
        Colors.white
  
      ]),
  
      borderRadius: BorderRadius.circular(12)
  
    ),
  
  
  
  
  
  ),
);


}