import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

   final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Mycompta', fontSize: 20.0);



  @override
  Widget build(BuildContext context) {

   final emailField = TextFormField(
      //obscureText: true,
      style: style,
      decoration: InputDecoration(

          contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
          labelText: "Card Number",
          hintText: 'xxxx xxxx xxxx xxxx',
          ),
    );

    final Exp_Date = TextFormField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(

          contentPadding: EdgeInsets.fromLTRB(20.0,0,0,10.0),
          labelText: "Exp Date",
          hintText: "MM/YY",
          ),
    );

    final name = TextFormField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(

          contentPadding: EdgeInsets.fromLTRB(20.0,0,0,10.0),
          labelText: "Name",
          hintText: "Name of the card holder",
          ),
    );

    final CVV = TextFormField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(

          contentPadding: EdgeInsets.fromLTRB(20.0,0,0,10.0),
          labelText: "CVV",
          hintText: "XXXX",
          ),
    );

    final text1=Text("Prototype");
    final nextButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(15.0),
      color: Color(0XFFab2785),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("NEXT",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(240.0),
        child: new AppBar(
        centerTitle: true,
      title: Column(children: [
        Text(
          "rewahub",
        ),
        GestureDetector(
          child: Text('PAYMENT METHODS'),
          onTap: () {
            print("tapped subtitle");
          },
        )
      ]),
        backgroundColor: Color.fromRGBO(189, 78, 97, 1),

       ), ),
      body: SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               SizedBox(height: 15.0),
                emailField,
                SizedBox(height: 15.0),
                Exp_Date,
                SizedBox(height: 15.0),
                name,
                SizedBox(height: 15.0),
                CVV,
                SizedBox(height: 15.0,),
                text1,
                SizedBox(height: 15.0,),
                nextButon,
              ],
            ),
          ),
        ),
      ),
        )
    );
  }
}
