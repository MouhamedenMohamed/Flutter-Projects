import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  int selectedTab = 0;

  Widget emailField() {
    return TextFormField(
      //obscureText: true,
  style: style,
  decoration: InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
    labelText: "Card Number",
    hintText: 'xxxx xxxx xxxx xxxx',
  ),
    );
  }

  Widget Exp_Date() {
    return TextFormField(
  obscureText: true,
  style: style,
  decoration: InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
    labelText: "Exp Date",
    hintText: "MM/YY",
  ),
    );
  }

  Widget name() {
    return TextFormField(
  obscureText: true,
  style: style,
  decoration: InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
    labelText: "Name",
    hintText: "Name of the card holder",
  ),
    );
  }

  Widget CVV() {
    return TextFormField(
  obscureText: true,
  style: style,
  decoration: InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
    labelText: "CVV",
    hintText: "XXXX",
  ),
    );
  }

  final text1 = Text("Prototype");

  Widget nextButon() {
    return Material(
  elevation: 5.0,
  borderRadius: BorderRadius.circular(15.0),
  color: Color(0XFFab2785),
  child: MaterialButton(
    minWidth: MediaQuery.of(context).size.width,
    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    onPressed: () {},
    child: Text(
      "NEXT",
      textAlign: TextAlign.center,
      style: style.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
    );
  }

  @override
  Widget build(BuildContext context) {
return DefaultTabController(
  length: 2,
  child: Scaffold(
    body: Stack(
      children: <Widget>[
        Container(
          height: 240.0,
          color: Color.fromRGBO(189, 78, 97, 1),
        ),
        Column(
          children: <Widget>[
            AppBar(
              elevation: 0,
              centerTitle: true,
              title: GestureDetector(
                child: Text('PAYMENT METHODS'),
                onTap: () {
                  print("tapped subtitle");
                },
              ),
              backgroundColor: Color.fromRGBO(189, 78, 97, 1),
            ),
            SizedBox(
              height: 20,
            ),
            TabBar(
              labelStyle: Theme.of(context).textTheme.body2,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2, color: Colors.white),
                insets: EdgeInsets.symmetric(
                  horizontal: 0,
                ),
              ),
              onTap: (int position) {
                setState(() {
                  selectedTab = position;
                });
              },
              tabs: [
                Tab(
                  child: new Text(
                    "Credit Card",
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .apply(color: Colors.white),
                  ),
                ),
                Tab(
                  child: new Text(
                    "Debit Card",
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .apply(color: Colors.white),
                  ),
                ),
              ],
            ),
            selectedTab == 0 ? creditCard() : debitCard(),
          ],
        ),
      ],
    ),
  ),
    );
  }

  Widget creditCard() {
    return SingleChildScrollView(
  child: Container(
    margin: EdgeInsets.all(40),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
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
                emailField(),
                SizedBox(height: 15.0),
                Exp_Date(),
                SizedBox(height: 15.0),
                name(),
                SizedBox(height: 15.0),
                CVV(),
                SizedBox(height: 15.0),
                text1,
                SizedBox(height: 15.0),
                nextButon(),
              ],
            ),
          ),
        ),
      ),
    ),
      ),
    );
 }

  Widget debitCard() {
    return SingleChildScrollView(
  child: Container(
    margin: EdgeInsets.all(40),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
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
                emailField(),
                SizedBox(height: 15.0),
                Exp_Date(),
                SizedBox(height: 15.0),
                name(),
                SizedBox(height: 15.0),
                CVV(),
                SizedBox(height: 15.0),
                text1,
                SizedBox(height: 15.0),
                nextButon(),
              ],
            ),
          ),
        ),
      ),
        ),
      ),
    );
  }
}